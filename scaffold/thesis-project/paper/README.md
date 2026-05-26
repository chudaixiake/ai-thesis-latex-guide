# Paper Directory

- `main.tex`: simplified project entry point.
- `chapters/`: chapter files included by `main.tex`.
- `template/`: optional template generated from the upstream repository (default: ECUST master thesis; replaceable).
- `assets/`: local thesis assets.

Compile:

```powershell
latexmk -xelatex main.tex
```
