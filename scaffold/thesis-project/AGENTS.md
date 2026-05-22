# Graduation Thesis Instructions

## Project Scope

- This repository is for an ECUST master thesis project.
- Main writing language: Chinese.
- Writing style: formal, clear, restrained, and suitable for a master's thesis.
- Do not invent references, datasets, experimental results, page numbers, DOI values, or institutional requirements.
- When source support is missing, mark the gap explicitly instead of filling it with plausible text.
- This project is not an official ECUST template package; final formatting must follow the latest school, college, and supervisor requirements.

## Repository Layout

- `paper/` contains LaTeX thesis files.
- `paper/main.tex` is the thesis entry point.
- `paper/chapters/` contains chapter files.
- `paper/template/` may contain a locally generated ECUST template from `blanche07/ecust-master-thesis-latex`.
- `docs/` contains outlines, notes, proposals, and reference-management files.
- `docs/references.bib` is the bibliography source exported by Zotero Better BibTeX.
- `figures/` contains thesis figures and exported charts.
- `data/raw/` contains original data and should not be modified directly.
- `data/processed/` contains cleaned or derived data.
- `scripts/` contains data processing and figure-generation scripts.

## AI Skills Protocol

- Before handling thesis writing, literature review, citation, polishing, figure, data, review, or defense-PPT tasks, read and follow `docs/ai-skills-workflow.md`.
- Choose skills by task stage:
  - Research planning and literature discovery: `deep-research`, `academic-paper`, `nature-academic-search`.
  - Paper reading and note extraction: `nature-reader`.
  - Chapter drafting: `academic-paper`, `nature-writing`, `awesome-ai-research-writing`.
  - Citation and bibliography checks: `nature-citation`.
  - Data analysis and result interpretation: `nature-data`.
  - Figure design and captions: `nature-figure`.
  - Academic polishing: `nature-polishing`, `awesome-ai-research-writing`, `humanizer`.
  - Thesis review and revision planning: `academic-paper-reviewer`, `nature-response`.
  - Defense slides: `nature-paper2ppt`.
- If multiple skills apply, use the smallest set that covers the task and state which skills are being used.
- If a named skill is unavailable in the current Codex session, say so and continue with the closest available workflow from `docs/ai-skills-workflow.md`.
- Do not bypass the workflow document for major thesis tasks unless the user explicitly asks for a one-off answer.

## Writing Workflow

- Start from `docs/thesis-config.md` and `docs/outline.md` before drafting full chapters.
- Draft and revise one chapter or section at a time.
- Keep claim-evidence links explicit: each important claim should have a citation, result, or user-provided source.
- Prefer concise paragraphs with clear topic sentences.
- Keep terminology consistent across all chapters.
- Use `docs/literature-matrix.md` or a spreadsheet to track papers before writing the literature review.
- For supervisor Word comments, follow `docs/word-review-workflow.md`: export Word files to `docs/export/`, store returned annotated files in `docs/review/`, summarize comments into a revision roadmap, then apply changes back to LaTeX.

## LaTeX Rules

- Preserve the school template style unless the user explicitly asks to change formatting.
- Use XeLaTeX for Chinese thesis compilation.
- Put reusable chapter content under `paper/chapters/`.
- Put figures under `figures/` and reference them with stable relative paths.
- After meaningful LaTeX edits, compile or at least run a syntax-oriented check when local tools are available.

## Git Rules

- Do not commit generated LaTeX auxiliary files.
- Do not rewrite history or discard user changes unless explicitly requested.
- Keep commits focused by writing stage, data stage, or formatting stage.
