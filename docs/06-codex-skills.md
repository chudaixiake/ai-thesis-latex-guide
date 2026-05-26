# 安装和使用 Codex Skills

Codex skills 是给 Codex 的任务说明包。写学术论文时，可以把文献检索、章节写作、引用检查、润色、审稿和答辩/汇报 PPT 分给不同 skills 处理。

## 适合论文写作的 skills

### 通用学术论文流程

- `academic-pipeline`：完整研究到论文流程。
- `academic-paper`：写大纲、章节、摘要、文献综述、LaTeX 正文。
- `deep-research`：文献调研、研究问题梳理、事实核查。
- `academic-paper-reviewer`：模拟导师或审稿人检查论文。
- `awesome-ai-research-writing`：中文学术润色、扩写、缩写、逻辑检查。
- `humanizer`：降低明显 AI 腔。
- `doc-coauthoring`：写开题报告、任务书、技术说明。

### Nature skills

来自仓库：

```text
https://github.com/Yuan1z0825/nature-skills
```

推荐安装：

- `nature-academic-search`
- `nature-reader`
- `nature-writing`
- `nature-citation`
- `nature-polishing`
- `nature-data`
- `nature-figure`
- `nature-response`
- `nature-paper2ppt`

## 安装 OpenAI curated skills

如果你的 Codex 环境里有 `skill-installer`，可以让 Codex 直接安装 curated skill，例如：

```text
安装 openai-docs skill
```

也可以安装论文相关 curated skills：

```text
安装 deep-research skill
安装 academic-paper skill
安装 academic-paper-reviewer skill
```

安装后需要重启 Codex 才会加载新 skills。

## 安装 Nature skills

在 Codex 里直接说：

```text
从 Yuan1z0825/nature-skills 安装所有 skills
```

如果需要手动执行，可以使用 skill-installer 脚本。路径按你的 Codex 安装位置调整：

```powershell
python "$env:USERPROFILE\.codex\skills\.system\skill-installer\scripts\install-skill-from-github.py" `
  --repo Yuan1z0825/nature-skills `
  --path skills/nature-academic-search `
         skills/nature-citation `
         skills/nature-data `
         skills/nature-figure `
         skills/nature-paper2ppt `
         skills/nature-polishing `
         skills/nature-reader `
         skills/nature-response `
         skills/nature-writing
```

安装完成后重启 Codex。

## 检查已安装 skills

Windows PowerShell：

```powershell
Get-ChildItem "$env:USERPROFILE\.codex\skills" -Directory |
  Select-Object Name |
  Sort-Object Name
```

如果安装成功，应能看到类似：

```text
nature-academic-search
nature-citation
nature-data
nature-figure
nature-paper2ppt
nature-polishing
nature-reader
nature-response
nature-writing
```

## 在论文项目中固定调用流程

建议在论文项目根目录放 `AGENTS.md`，并加入类似规则：

```md
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
- Do not bypass the workflow document for major thesis tasks unless the user explicitly asks for a one-off answer.
```

同时在项目里放一份 `docs/ai-skills-workflow.md`，记录具体阶段流程。

## 推荐调用流程

### 1. 选题和研究问题

```text
使用 deep-research，围绕 thesis-config.md，帮我梳理研究问题、研究对象和可行方法。
```

### 2. 文献阅读

```text
使用 nature-reader，阅读这篇论文，按 docs/notes/literature-note-template.md 的模板整理笔记，
保存为 docs/notes/{citation-key}.md。
同时更新 docs/literature-matrix.md 中对应行。
```

### 3. 章节写作

```text
使用 academic-paper 和 nature-writing，基于 docs/outline.md 和 docs/references.bib，帮我写第 1.1 节研究背景。
要求：不要编造引用；没有 citation key 的地方用 [需要引用] 标记。
```

### 4. 引用检查

```text
使用 nature-citation，检查 paper/chapters 中所有 citation key 是否存在于 docs/references.bib。
```

### 5. 图表和结果

```text
使用 nature-data 和 nature-figure，帮我检查第 4 章的数据结果表达，并设计适合论文的图表和图注。
```

### 6. 润色

```text
使用 nature-polishing，润色 paper/chapters/02-literature.tex，保持学术中文风格，不改变原意。
```

### 7. 审查和修改

```text
使用 academic-paper-reviewer，按硕士论文标准审查当前论文结构、论证、方法、引用和格式问题。
```

### 8. 答辩 PPT

```text
使用 nature-paper2ppt，基于论文目录和摘要，生成答辩 PPT 大纲。
```

## 常用组合

```text
deep-research
→ academic-paper / nature-writing
→ nature-citation
→ nature-polishing / awesome-ai-research-writing
→ academic-paper-reviewer
→ nature-paper2ppt
```

## 注意事项

- 不要让 AI 编造文献、DOI、页码、数据和实验结果。
- 不要让 AI 隐去第三方模板来源或规避许可证。
- 不要一次性生成整篇论文后直接使用。
- 引用必须来自 Zotero 导出的 `.bib` 文件或用户明确提供的材料。
- 重大改动后运行 LaTeX 编译检查。
