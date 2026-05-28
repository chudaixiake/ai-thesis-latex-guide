# Academic Writing Project Instructions

## Project Scope

- This repository is for an academic writing project (thesis, journal paper, conference paper, or any LaTeX document — any school or journal).
- Main writing language: Chinese (or English, configurable).
- Writing style: formal, clear, restrained, and suitable for academic writing.
- Do not invent references, datasets, experimental results, page numbers, DOI values, or formatting requirements.
- When source support is missing, mark the gap explicitly instead of filling it with plausible text.
- The default template in `paper/template/` is based on ECUST master thesis format as a **placeholder example**. **After the project skeleton is generated, provide your actual school or journal LaTeX template to Codex/Claude Code and it will adapt.**
- Final formatting must follow the latest requirements from your target (school graduate office / journal editorial).

## Repository Layout

- `paper/` contains LaTeX files.
- `paper/main.tex` is the document entry point.
- `paper/chapters/` contains chapter or section files.
- `paper/template/` contains the LaTeX format template (default: ECUST master as placeholder; replaceable after skeleton generation by telling Codex).
- `docs/` contains outlines, notes, proposals, and reference-management files.
- `docs/references.bib` is the bibliography source exported by Zotero Better BibTeX.
- `docs/notes/` contains literature reading notes. Use `docs/notes/literature-note-template.md` as the template for each paper.
- `docs/literature-matrix.md` provides a birds-eye view of all papers read.
- `figures/` contains thesis figures and exported charts.
- `data/raw/` contains original data and should not be modified directly.
- `data/processed/` contains cleaned or derived data.
- `scripts/` contains data processing and figure-generation scripts.

## AI Skills Protocol

- Before handling academic writing, literature review, citation, polishing, figure, data, review, or presentation tasks, read and follow `docs/ai-skills-workflow.md`.
- For major chapter drafting, template adaptation, reviewer/supervisor revision, citation cleanup, or formatting changes, also read `docs/workflow/writing-pipeline.md` and `docs/workflow/quality-gates.md`.
- For each major task, create or update a worklog under `docs/worklog/YYYY-MM-DD-task-name/summary.md` using `docs/workflow/change-log-template.md`.
- Choose skills by task stage:
  - Research planning and literature discovery: `deep-research`, `academic-paper`, `nature-academic-search`.
  - Paper reading and note extraction: `nature-reader`. Save each paper's notes as `docs/notes/{citation-key}.md` using the template in `docs/notes/literature-note-template.md`.
  - Chapter drafting: `academic-paper`, `nature-writing`, `awesome-ai-research-writing`.
  - Citation and bibliography checks: `nature-citation`.
  - Data analysis and result interpretation: `nature-data`.
  - Figure design and captions: `nature-figure`.
  - Academic polishing: `nature-polishing`, `awesome-ai-research-writing`, `humanizer`.
  - Document review and revision planning: `academic-paper-reviewer`, `nature-response`.
  - Presentation slides: `nature-paper2ppt`.
- If multiple skills apply, use the smallest set that covers the task and state which skills are being used.
- If a named skill is unavailable in the current Codex session, say so and continue with the closest available workflow from `docs/ai-skills-workflow.md`.
- Do not bypass the workflow document for major writing tasks unless the user explicitly asks for a one-off answer.

## Writing Workflow

- Start from `docs/thesis-config.md` and `docs/outline.md` before drafting full content.
- Treat `AGENTS.md` as an index and map. Load deeper workflow files only when the task requires them.
- Draft and revise one section at a time.
- Before substantial edits, write a short plan and expected outputs in the current `docs/worklog/` entry.
- Keep claim-evidence links explicit: each important claim should have a citation, result, or user-provided source.
- Prefer concise paragraphs with clear topic sentences.
- Keep terminology consistent across the entire document.
- Use `docs/literature-matrix.md` to track all papers at a glance; keep detailed notes per paper in `docs/notes/{citation-key}.md` using the template `docs/notes/literature-note-template.md`.
- When writing the literature review, consult the notes in `docs/notes/` and the matrix in `docs/literature-matrix.md`.
- For reviewer/supervisor Word comments, follow `docs/word-review-workflow.md`: export Word files to `docs/export/`, store returned annotated files in `docs/review/`, summarize comments into a revision roadmap, then apply changes back to LaTeX.
- After each major writing round, update the worklog with changed files, citation gaps, validation results, and next steps.

## Quality Gates

- Do not mark a major writing task complete until unresolved citation, data, formatting, and compilation issues are listed.
- Prefer mechanical checks where possible: BibTeX key lookup, LaTeX compilation, file path checks, and review-doc export checks.
- If `latexmk -xelatex main.tex` cannot be run locally, state that clearly and record the reason in the worklog.
- Keep execution and review separate for important changes: after drafting, review the output against `docs/workflow/quality-gates.md` before final delivery.

## LaTeX Rules

- Preserve the current template style unless the user explicitly asks to change formatting (or provides a new template).
- Treat `paper/template/template.tex` and its associated assets (fonts, style files) as format-critical files. Do not change fonts, margins, headers, title styles, bibliography style, or template structure unless the user explicitly asks for a formatting change.
- Put content edits in the intended content locations and avoid rewriting format definitions.
- Use XeLaTeX for Chinese document compilation.
- Put reusable chapter content under `paper/chapters/`.
- Put figures under `figures/` and reference them with stable relative paths.
- After meaningful LaTeX edits, compile or at least run a syntax-oriented check when local tools are available.

## Git Rules

- Do not commit generated LaTeX auxiliary files.
- Do not rewrite history or discard user changes unless explicitly requested.
- Keep commits focused by writing stage, data stage, or formatting stage.
