# LaTeX Project Template

This repository provides a modular LaTeX project template, designed for creating presentations or documents with a clean, maintainable structure. It includes scripts for installation, building, and cleaning up auxiliary files.

## Project Structure

- **template/**: Contains all LaTeX source files.
  - **preamble/**: Preamble files (packages, commands, beamer settings).
  - **sections/**: Individual section files for each topic.
  - **images/**: Images used in the presentation.
  - **style_files/**: Style files and logos.
- **scripts/**: Contains installation and build scripts.
- **.github/workflows/**: GitHub Actions workflow for building the PDF.

## Setup

### Prerequisites

- LaTeX distribution (e.g., TeX Live)
- `latexmk` for building

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. Install dependencies:
   ```bash
   cd scripts
   bash install.sh
   ```

## Building the Document

### Local Build

To build the document locally, run:
```bash
cd scripts
bash build.sh
```
The output will be `src/main.pdf`.

### Custom Output Location

To specify a custom output location for the PDF, use:
```bash
bash build.sh --output /path/to/directory
```

### Custom PDF Name

To specify a custom name for the PDF, use:
```bash
bash build.sh --name custom_name.pdf
```

### Combined Options

You can combine options to specify both the output directory and the PDF name:
```bash
bash build.sh --output /path/to/directory --name custom_name.pdf
```

## Continuous Integration

The project uses GitHub Actions to automatically build the PDF on push and pull requests. The PDF is uploaded as an artifact.

## Contributing

1. Fork the repository.
2. Create a new branch for your feature.
3. Make your changes.
4. Submit a pull request.

## License

This project is licensed under the GPL-3.0 License - see the LICENSE file for details. 