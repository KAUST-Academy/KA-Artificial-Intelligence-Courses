#!/bin/bash
set -e

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
# PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Default output directory is the current directory
OUTPUT_DIR="Lectures"
TEX_FILE=""
FILE_PREFIX=""

# Parse command line arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --output)
      OUTPUT_DIR="$2"
      shift 2
      ;;
    --file)
      TEX_FILE="$2"
      shift 2
      ;;
    --prefix)
      FILE_PREFIX="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1"
      echo "Usage: $0 [--file filename.tex] [--output output_dir]"
      exit 1
      ;;
  esac
done

# Ensure the output directory exists
if [ "$OUTPUT_DIR" != "." ]; then
  mkdir -p "$OUTPUT_DIR"
fi

# Navigate to the source directory
cd "$SCRIPT_DIR/LaTeX" || { echo "Error: Could not find template directory"; exit 1; }

# Build the PDF
echo "Building PDF..."
if [ -n "$TEX_FILE" ]; then
  if [ ! -f "$TEX_FILE" ]; then
    echo "Error: Specified file '$TEX_FILE' not found."
    exit 1
  fi
  latexmk -pdf -shell-escape -interaction=nonstopmode -file-line-error -bibtex -use-make "$TEX_FILE" || echo "Warning: PDF build had issues but continuing..."
  latexmk -pdf -shell-escape -interaction=nonstopmode -file-line-error -bibtex -use-make "$TEX_FILE" || echo "Warning: PDF build had issues but continuing..."
else
  # Main .tex files live in per-topic subfolders (CV/ NLP/ GenAI/ ...).
  # Collect them while skipping the shared infra folders, which contain
  # \input-only fragments (cover.tex, packages.tex, ...) that are NOT
  # standalone documents and must not be compiled directly.
  SHARED_DIRS="preamble sections images assets style_files"
  TEX_FILES=()
  for dir in */; do
    dir="${dir%/}"
    case " $SHARED_DIRS " in *" $dir "*) continue ;; esac
    for f in "$dir"/$FILE_PREFIX*.tex; do
      [ -f "$f" ] && TEX_FILES+=("$f")
    done
  done
  if [ ${#TEX_FILES[@]} -eq 0 ]; then
    echo "No matching .tex files found in topic subfolders."; exit 1
  fi
  echo "Building ${#TEX_FILES[@]} file(s): ${TEX_FILES[*]}"
  latexmk -pdf -shell-escape -interaction=nonstopmode -file-line-error -bibtex -use-make "${TEX_FILES[@]}" || echo "Warning: PDF build had issues but continuing..."
  latexmk -pdf -shell-escape -interaction=nonstopmode -file-line-error -bibtex -use-make "${TEX_FILES[@]}" || echo "Warning: PDF build had issues but continuing..."
fi
# latexmk -f -pdf *.tex || echo "Warning: PDF build had issues but continuing..."
# latexmk -pdf -shell-escape -interaction=nonstopmode -file-line-error -bibtex -use-make *.tex || echo "Warning: PDF build had issues but continuing..."


# Move the PDF to the specified output directory
if [ "$OUTPUT_DIR" != "." ]; then
  echo "Moving PDFs to $OUTPUT_DIR/"
  if [ -n "$TEX_FILE" ]; then
    # latexmk writes the PDF into the cwd (LaTeX/) using the basename only,
    # even when the source .tex is in a subfolder (e.g. CV/Day-1_CNN_Recap.tex).
    PDF_NAME="$(basename "${TEX_FILE%.tex}").pdf"
    mv "$PDF_NAME" "../$OUTPUT_DIR/" || { echo "Error: Could not move PDF"; exit 1; }
  else
    mv *.pdf "../$OUTPUT_DIR/" || { echo "Error: Could not move PDFs"; exit 1; }
  fi
  # mv *.pdf "../$OUTPUT_DIR/" || { echo "Error: Could not move PDF"; exit 1; }
fi

# Clean up auxiliary files (latexmk writes them into the cwd / LaTeX root,
# so clean here regardless of which subfolder the source .tex lives in).
echo "Cleaning up auxiliary files..."
latexmk -C */*.tex 2>/dev/null || true
rm -f *.nav *.snm *.out *.toc *.aux *.bbl *.blg *.log *.fdb_latexmk *.fls *.vrb *.bcf *.run.xml *.synctex.gz 2>/dev/null || true

echo "Build completed successfully!" 