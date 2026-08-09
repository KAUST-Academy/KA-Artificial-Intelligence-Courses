#!/bin/bash
# Build lecture PDFs.
#
# Exits non-zero if any deck fails to compile, and preserves the .log of every
# failing deck under build/logs/ so the error can be inspected afterwards.
# A deck counts as failed if latexmk returns non-zero OR its log contains LaTeX
# errors (latexmk/MiKTeX can return success on recoverable errors).

set -uo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

OUTPUT_DIR="Lectures"
TEX_FILE=""
FILE_PREFIX=""
KEEP_LOGS=0

while [[ $# -gt 0 ]]; do
  case $1 in
    --output)    OUTPUT_DIR="$2"; shift 2 ;;
    --file)      TEX_FILE="$2";   shift 2 ;;
    --prefix)    FILE_PREFIX="$2"; shift 2 ;;
    --keep-logs) KEEP_LOGS=1;     shift ;;
    -h|--help)
      echo "Usage: $0 [--file <Topic>/<name>.tex] [--prefix NN] [--output dir] [--keep-logs]"
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      echo "Usage: $0 [--file <Topic>/<name>.tex] [--prefix NN] [--output dir] [--keep-logs]"
      exit 1
      ;;
  esac
done

if [ "$OUTPUT_DIR" != "." ]; then
  mkdir -p "$OUTPUT_DIR"
fi

LOG_DIR="$SCRIPT_DIR/build/logs"

cd "$SCRIPT_DIR/LaTeX" || { echo "Error: Could not find LaTeX source directory"; exit 1; }

# Error patterns that mean the deck did not compile cleanly. Kept in sync with
# the check used by the review workflow.
ERR_RE='^!|\.tex:[0-9]+:.*(Error|Undefined control sequence|Misplaced|Runaway|Illegal parameter|You can'"'"'t use)'

# Collect the .tex files to build.
TEX_FILES=()
if [ -n "$TEX_FILE" ]; then
  if [ ! -f "$TEX_FILE" ]; then
    echo "Error: Specified file '$TEX_FILE' not found."
    exit 1
  fi
  TEX_FILES+=("$TEX_FILE")
else
  # Main .tex files live in per-topic subfolders (CV/ NLP/ GenAI/ ...).
  # Skip the shared infra folders: they hold \input-only fragments
  # (cover.tex, packages.tex, ...) that are not standalone documents.
  SHARED_DIRS="preamble sections images assets style_files"
  for dir in */; do
    dir="${dir%/}"
    case " $SHARED_DIRS " in *" $dir "*) continue ;; esac
    for f in "$dir"/$FILE_PREFIX*.tex; do
      [ -f "$f" ] && TEX_FILES+=("$f")
    done
  done
  if [ ${#TEX_FILES[@]} -eq 0 ]; then
    echo "No matching .tex files found in topic subfolders."
    exit 1
  fi
fi

echo "Building ${#TEX_FILES[@]} file(s): ${TEX_FILES[*]}"

FAILED=()

for f in "${TEX_FILES[@]}"; do
  base="$(basename "${f%.tex}")"
  echo "--- $f"

  # Two passes so references, the TOC and the bibliography resolve.
  latexmk -pdf -shell-escape -interaction=nonstopmode -file-line-error -bibtex -use-make "$f" > /dev/null 2>&1
  latexmk -pdf -shell-escape -interaction=nonstopmode -file-line-error -bibtex -use-make "$f" > /dev/null 2>&1
  status=$?

  log="$base.log"
  errs=0
  if [ -f "$log" ]; then
    errs=$(grep -cE "$ERR_RE" "$log" || true)
  fi

  if [ ! -f "$base.pdf" ] || [ "$status" -ne 0 ] || [ "$errs" -ne 0 ]; then
    FAILED+=("$base")
    mkdir -p "$LOG_DIR"
    [ -f "$log" ] && cp "$log" "$LOG_DIR/$base.log"
    echo "  FAILED  ($errs error line(s); log kept at build/logs/$base.log)"
    if [ -f "$log" ]; then
      grep -nE "$ERR_RE" "$log" | head -5 | sed 's/^/      /'
    fi
  else
    pages=$(pdfinfo "$base.pdf" 2>/dev/null | awk '/^Pages/{print $2}')
    over=$(grep -c 'Overfull \\vbox' "$log" 2>/dev/null || true)
    miss=$(grep -c 'LaTeX Warning: File .* not found' "$log" 2>/dev/null || true)
    echo "  ok  pages=${pages:-?}  overfull_vbox=$over  missing_images=$miss"
  fi
done

# Move the built PDFs to the output directory.
if [ "$OUTPUT_DIR" != "." ]; then
  echo "Moving PDFs to $OUTPUT_DIR/"
  for f in "${TEX_FILES[@]}"; do
    base="$(basename "${f%.tex}")"
    # latexmk writes the PDF into the cwd (LaTeX/) using the basename only,
    # even when the source .tex lives in a subfolder.
    if [ -f "$base.pdf" ]; then
      mv "$base.pdf" "../$OUTPUT_DIR/" || { echo "Error: Could not move $base.pdf"; exit 1; }
    fi
  done
fi

# Clean auxiliary files. Failing decks keep a copy of their log in build/logs/.
if [ "$KEEP_LOGS" -eq 0 ]; then
  echo "Cleaning up auxiliary files..."
  latexmk -C */*.tex > /dev/null 2>&1 || true
  rm -f *.nav *.snm *.out *.toc *.aux *.bbl *.blg *.log *.fdb_latexmk *.fls *.vrb *.bcf *.run.xml *.synctex.gz 2>/dev/null || true
  echo "Auxiliary files cleaned."
else
  echo "Keeping auxiliary files (--keep-logs)."
fi

if [ ${#FAILED[@]} -ne 0 ]; then
  echo
  echo "BUILD FAILED for ${#FAILED[@]} deck(s): ${FAILED[*]}"
  echo "Logs preserved in build/logs/"
  exit 1
fi

echo "Build completed successfully!"
