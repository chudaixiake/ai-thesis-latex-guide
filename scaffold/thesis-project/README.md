# ECUST Master Thesis Project

这是一个面向华东理工大学硕士论文写作的项目骨架，用于配合 Codex 或 Claude Code 完成论文写作、文献管理、LaTeX 编译和版本管理。

## 目录

```text
data/
  raw/          原始数据，不直接修改。
  processed/    清洗或处理后的数据。
docs/           论文配置、大纲、笔记、参考文献。
figures/        论文图片和导出图表。
paper/          LaTeX 主项目。
scripts/        数据处理和绘图脚本。
```

## 第一次使用

1. 填写 `docs/thesis-config.md`。
2. 修改 `docs/outline.md`。
3. 在 Zotero 中建立论文 Collection，并用 Better BibTeX 自动导出到 `docs/references.bib`。
4. 让 Codex 或 Claude Code 按 `docs/ai-skills-workflow.md` 工作。
5. 编译 `paper/main.tex`。

## 导出 Word 给导师批注

```powershell
powershell -ExecutionPolicy Bypass -File scripts/export-review-docx.ps1
```

默认输出：

```text
docs/export/review-draft.docx
```

导师返回的批注版 Word 放到：

```text
docs/review/
```

然后让 Codex 或 Claude Code 根据 `docs/word-review-workflow.md` 整理修改清单并改回 LaTeX。

Word 审阅稿格式可参考：

```text
word/ecust-word-format-spec.md
```

## 常用命令

```powershell
cd paper
latexmk -xelatex main.tex
```

如果使用本地生成的 ECUST 模板：

```powershell
cd paper\template
latexmk -xelatex template.tex
```

## 给 Codex / Claude Code 的常用指令

```text
根据 docs/thesis-config.md 和 docs/outline.md，帮我细化论文大纲。
```

```text
使用 academic-paper 和 nature-writing，直接修改 paper/chapters/01-introduction.tex。
目标：补全研究背景和研究意义。
限制：不要编造引用；没有来源的位置用 [需要引用] 标记。
```
