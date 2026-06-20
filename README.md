# KA-Artificial-Intelligence-Courses
This is the base repo for all Artificial Intelligence courses for KAUST Academy.


# LaTeX Project Build Script

This repository contains a Bash script to compile LaTeX (`.tex`) files into PDFs using `latexmk`. It supports building either all LaTeX files in the project or a specific one, and moving the output to a designated directory.

## 📁 Project Structure

```

project-root/
│
├── build.sh           # The build script
├── Lectures/          # (Default) Output directory for generated PDFs
└── LaTeX/             # LaTeX project
    ├── Computer_Vision/   # Compilable main .tex, organized by topic
    │   ├── 01_Introduction_to_Computer_Vision_and_CNNs.tex
    │   └── ...
    ├── Natural_Language_Processing/
    ├── Generative_AI/
    ├── Introduction_To_AI/
    ├── Reinforcement_Learning/
    ├── Review_needed/
    ├── sections/      # Shared content \input{sections/...}
    ├── preamble/      # Shared \input{preamble/...}
    ├── images/        # Shared figures
    ├── assets/        # Shared per-lecture assets
    ├── style_files/   # Logos + .sty helpers
    └── *.sty *.cls references.bib   # Shared beamer theme + bibliography

```

## 🛠️ Requirements

- `latexmk`
- A working LaTeX distribution (e.g., TeX Live or MiKTeX)
- Bash shell

## 🚀 Usage

From the root directory, run the build script:

### Compile All `.tex` Files

```bash
./build.sh
````

This compiles **all** `.tex` files across the topic subfolders in `LaTeX/` and moves the resulting PDFs to the `Lectures/` folder.

### Compile a Specific File

```bash
./build.sh --file Computer_Vision/01_Introduction_to_Computer_Vision_and_CNNs.tex
```

Pass the path **relative to the `LaTeX/` directory**, i.e. `<Topic>/<filename>.tex` (the main `.tex` files live in topic subfolders such as `Computer_Vision/`, `Natural_Language_Processing/`, `Generative_AI/`, `Introduction_To_AI/`, `Reinforcement_Learning/`, `Review_needed/`).

### Specify an Output Directory

```bash
./build.sh --output CustomOutputDir
```

You can combine this with the `--file` flag:

```bash
./build.sh --file filename.tex --output CustomOutputDir
```

## 🧹 Cleanup

The script automatically cleans up auxiliary files generated during the build process, such as `.aux`, `.log`, `.toc`, etc.

## ❗ Notes

* Main LaTeX source files live in **topic subfolders under `LaTeX/`** (e.g. `LaTeX/CV/`, `LaTeX/NLP/`); shared content (`sections/`, `preamble/`, `images/`, themes) stays at the `LaTeX/` root so builds must run from there (the script handles this).
* When using `--file`, give the path relative to `LaTeX/`, e.g. `--file Natural_Language_Processing/Lecture-9_Prompting+RAG.tex`.
* If the specified file does not exist, the script will exit with an error.
* If no `--file` is provided, the script will default to building all `.tex` files.

## 📄 License

This project is licensed under the GPL-3.0 License - see the LICENSE file for details. 



---
To ensure your commit messages are properly parsed by tools like `conventional-changelog` and accurately reflected in your changelog, it's essential to adhere to the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) specification. This structured format not only facilitates automated changelog generation but also aids in semantic versioning.

### ✅ Conventional Commit Message Structure

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

* **`type`**: Indicates the nature of the change. Common types include:

  * `feat`: A new feature
  * `fix`: A bug fix
  * `docs`: Documentation changes
  * `style`: Code style changes (formatting, missing semi-colons, etc.)
  * `refactor`: Code changes that neither fix a bug nor add a feature
  * `perf`: Performance improvements
  * `test`: Adding or correcting tests
  * `chore`: Maintenance tasks (build process, auxiliary tools, libraries)

* **`scope`** *(optional)*: Provides additional contextual information, typically the name of the affected module or component, enclosed in parentheses.

* **`description`**: A concise summary of the change, written in the imperative mood (e.g., "add", "fix", "update").

* **`body`** *(optional)*: A more detailed explanation of the change, its rationale, and any relevant background information.

* **`footer(s)`** *(optional)*: Additional metadata, such as issue references or notes about breaking changes.

### 🛠 Examples

#### 1. **Adding a New Feature**

```
feat(auth): add OAuth2 login support
```

*Adds a new feature to the authentication module.*

#### 2. **Fixing a Bug**

```
fix(api): resolve null pointer exception on user creation
```

*Fixes a bug in the API module related to user creation.*

#### 3. **Documentation Update**

```
docs(readme): update installation instructions
```

*Updates the installation instructions in the README.*

#### 4. **Code Refactoring**

```
refactor(database): optimize query performance
```

*Refactors database queries for improved performance.*

#### 5. **Performance Improvement**

```
perf(image-processing): reduce image loading time
```

*Improves the performance of image loading in the image-processing module.*

#### 6. **Test Addition**

```
test(auth): add unit tests for login functionality
```

*Adds unit tests for the login functionality in the authentication module.*

#### 7. **Chore Task**

```
chore(deps): update dependency versions
```

*Updates project dependencies to their latest versions.*

#### 8. **Breaking Change**

If a commit introduces a breaking change, indicate it by adding an exclamation mark (`!`) after the type or scope, and include a `BREAKING CHANGE` footer:

```
feat(auth)!: remove legacy authentication methods

BREAKING CHANGE: The legacy authentication methods have been removed. Users must now use OAuth2.
```

*Introduces a breaking change by removing legacy authentication methods.*

### 🔗 Linking to Issues

To associate commits with issues, include references in the footer:

```
fix(auth): correct password reset link

Resolves: #123
```

*Fixes issue number 123 related to password reset links.*

### 📌 Tips for Effective Commit Messages

* **Use the imperative mood**: Write as if you're giving a command (e.g., "add feature", not "added feature").
* **Be concise**: Keep the subject line under 50 characters if possible.
* **Provide context**: Use the body to explain the "why" behind the change.
* **Consistent formatting**: Maintain a consistent structure to facilitate automated tools.

By following the Conventional Commits specification, you ensure that your commit messages are clear, consistent, and machine-readable, enabling efficient changelog generation and semantic versioning.

If you need further assistance or examples tailored to your project's specific needs, feel free to ask!
