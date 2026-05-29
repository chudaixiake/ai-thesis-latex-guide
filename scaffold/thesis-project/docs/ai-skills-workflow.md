# AI Skills Workflow

## Recommended Skill Flow

```text
deep-research
→ academic-paper / nature-writing
→ nature-citation
→ nature-polishing / awesome-ai-research-writing
→ academic-paper-reviewer
→ nature-paper2ppt
```

## Stage Guide

重大写作任务应同时参考：

- `docs/workflow/writing-pipeline.md`
- `docs/workflow/quality-gates.md`
- `docs/workflow/change-log-template.md`

### Research planning

Use:

- `deep-research`
- `academic-paper`
- `nature-academic-search`

Prompt:

```text
使用 deep-research，围绕 docs/thesis-config.md，帮我梳理研究问题、研究对象和可行方法。
```

### Literature reading

Use:

- `nature-reader`
- `deep-research`

Prompt:

```text
使用 nature-reader，阅读这篇论文，按 docs/notes/literature-note-template.md 的模板整理笔记，
保存为 docs/notes/{citation-key}.md。
同时更新 docs/literature-matrix.md 中对应行。
```

### Chapter drafting

Use:

- `academic-paper`
- `nature-writing`
- `awesome-ai-research-writing`

Prompt:

```text
使用 academic-paper 和 nature-writing，直接修改 paper/chapters/01-introduction.tex。
依据：docs/thesis-config.md、docs/outline.md、docs/references.bib。
限制：不要编造引用；没有来源的位置用 [需要引用] 标记。
```

### Citation check

Use:

- `nature-citation`

Prompt:

```text
使用 nature-citation，检查 paper/chapters 中所有 citation key 是否存在于 docs/references.bib。
```

### Polishing

Use:

- `nature-polishing`
- `awesome-ai-research-writing`
- `humanizer`

Prompt:

```text
使用 nature-polishing，润色指定章节，保持中文硕士论文风格，不改变事实和引用。
```

### Review

Use:

- `academic-paper-reviewer`
- `nature-response`

Prompt:

```text
使用 academic-paper-reviewer，按硕士论文标准审查当前论文结构、论证、方法、引用和格式问题。
```

## Rules

- Do not invent references, DOI, page numbers, data, or experimental results.
- Do not hide third-party template sources or bypass licenses.
- Use Zotero-exported `docs/references.bib` as the citation source.
- Major LaTeX changes should be compiled when local tools are available.
- Major writing or revision tasks should leave a concise record under `docs/worklog/`.
