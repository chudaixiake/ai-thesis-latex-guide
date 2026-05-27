# Paper Directory

- `main.tex`: simplified project entry point. Edit `\SchoolName` and `\ThesisType` for your school.
- `latexmkrc`: latexmk configuration for XeLaTeX + Biber.
- `chapters/`: chapter files included by `main.tex`. Each file contains writing guidance comments.
- `template/`: optional template generated from the upstream repository (default: ECUST master thesis; replaceable).
- `assets/`: local thesis assets.

Compile:

```bash
latexmk -xelatex main.tex
```

If using the default template in `paper/template/`:

```bash
cd template
latexmk -xelatex template.tex
```
