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
  latexmk -pdf -shell-escape -interaction=nonstopmode -file-line-error -bibtex -use-make $FILE_PREFIX*.tex || echo "Warning: PDF build had issues but continuing..."
  latexmk -pdf -shell-escape -interaction=nonstopmode -file-line-error -bibtex -use-make $FILE_PREFIX*.tex || echo "Warning: PDF build had issues but continuing..."
fi
# latexmk -f -pdf *.tex || echo "Warning: PDF build had issues but continuing..."
# latexmk -pdf -shell-escape -interaction=nonstopmode -file-line-error -bibtex -use-make *.tex || echo "Warning: PDF build had issues but continuing..."


# Move the PDF to the specified output directory
if [ "$OUTPUT_DIR" != "." ]; then
  echo "Moving PDFs to $OUTPUT_DIR/"
  if [ -n "$TEX_FILE" ]; then
    PDF_NAME="${TEX_FILE%.tex}.pdf"
    mv "$PDF_NAME" "../$OUTPUT_DIR/" || { echo "Error: Could not move PDF"; exit 1; }
  else
    mv *.pdf "../$OUTPUT_DIR/" || { echo "Error: Could not move PDFs"; exit 1; }
  fi
  # mv *.pdf "../$OUTPUT_DIR/" || { echo "Error: Could not move PDF"; exit 1; }
fi

# Clean up auxiliary files
echo "Cleaning up auxiliary files..."
latexmk -C
rm -r *.nav *.snm *.out *.toc *.aux *.bbl *.log *.fdb_latexmk *.fls *.vrb *.bcf *.run.xml *.synctex.gz || { echo "Error: Could not clean auxiliary files"; exit 1; }

echo "Build completed successfully!" 