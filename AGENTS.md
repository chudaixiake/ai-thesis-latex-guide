# Repository Instructions

- Write documentation in concise Chinese.
- Position this repository as a **generic AI-assisted academic writing workflow guide** (thesis, journal paper, or any LaTeX-based document).
- The built-in default template is based on ECUST master thesis format, but users can provide any school or journal LaTeX template and tell Codex/Claude Code to adapt — **this step happens after the project skeleton is generated**.
- Keep a clear non-official disclaimer when discussing school-specific thesis formatting.
- Do not copy third-party LaTeX templates into this repository unless their license is checked and attribution is preserved.
- Keep `scaffold/thesis-project/` as the reusable project skeleton for users who want Codex or Claude Code to do academic writing work with minimal manual setup.
- Keep the template generic and educational.
- Prefer commands that work on Windows PowerShell.
- Do not fabricate Zotero, TeX Live, or LaTeX package behavior.
- When updating the template, keep `latexmk -xelatex main.tex` as the primary compile path.
