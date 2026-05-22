# Word 批注往返流程

很多导师习惯使用 Word 批注。推荐采用：

```text
LaTeX 主稿 -> 导出 Word 审阅稿 -> 导师批注 -> 整理修改清单 -> 改回 LaTeX
```

不要把 Word 文件作为最终源文件。LaTeX 仍然负责正式排版和最终 PDF。

## 先明确一个限制

从 LaTeX 导出的 Word 和 LaTeX 编译出来的 PDF **不会完全同版**。原因是：

- Word 和 LaTeX 的排版引擎不同。
- 学校模板中的页眉、目录、题注、参考文献样式、字体细节不一定能被 Pandoc 完整转换。
- 复杂宏包和自定义命令在 Word 中通常只能近似表达。

因此推荐给导师同时发两份：

```text
review-draft.pdf   看最终排版
review-draft.docx  做文字批注
```

导师如果主要改文字，用 Word 批注；如果指出格式问题，以 PDF 为准。

## 一键导出脚本

一键论文项目骨架自带：

```text
scripts/export-review-docx.ps1
```

本教程仓库根目录也提供了同名通用脚本：

```text
scripts/export-review-docx.ps1
```

在论文项目里运行：

```powershell
cd D:\GraduationThesis
powershell -ExecutionPolicy Bypass -File scripts/export-review-docx.ps1
```

或者从本教程仓库对指定项目运行：

```powershell
cd D:\ai-thesis-latex-guide
powershell -ExecutionPolicy Bypass -File scripts/export-review-docx.ps1 `
  -ProjectRoot D:\GraduationThesis
```

默认输出：

```text
docs/export/review-draft.docx
```

脚本会从 `paper/main.tex` 导出 Word，并尝试解析 `paper/chapters/` 中的章节文件。它还会过滤部分 Pandoc 不认识的 LaTeX 模板命令。

注意：这个 Word 文件是审阅稿，不是最终排版稿。

## 同时导出 PDF 和 Word

PDF 用 LaTeX 编译：

```powershell
cd D:\GraduationThesis\paper
latexmk -xelatex main.tex
Copy-Item main.pdf ..\docs\export\review-draft.pdf -Force
```

Word 用 Pandoc 导出：

```powershell
cd D:\GraduationThesis
powershell -ExecutionPolicy Bypass -File scripts/export-review-docx.ps1
```

然后把这两个文件一起发给导师：

```text
docs/export/review-draft.pdf
docs/export/review-draft.docx
```

指定日期文件名：

```powershell
powershell -ExecutionPolicy Bypass -File scripts/export-review-docx.ps1 `
  -OutputDocx docs/export/review-draft-20260522.docx
```

## 目录约定

```text
docs/export/   发给导师的 Word/PDF
docs/review/   导师返回的批注版 Word
```

建议命名：

```text
docs/export/review-draft-YYYYMMDD.docx
docs/review/supervisor-comments-YYYYMMDD.docx
docs/revision-roadmap-YYYYMMDD.md
```

## 让 Codex / Claude Code 处理批注

导师批注回来后，放入 `docs/review/`，然后说：

```text
请读取 docs/review/supervisor-comments-YYYYMMDD.docx，整理导师所有批注和修改建议，生成 docs/revision-roadmap-YYYYMMDD.md。
```

再说：

```text
根据 docs/revision-roadmap-YYYYMMDD.md，逐条修改 paper/chapters 中对应章节。不要改动未提到的内容。
```

改完后：

```text
使用 academic-paper-reviewer，检查这次修改是否完整回应了导师意见。
```

## 推荐 skills

- `nature-response`：整理导师意见。
- `academic-paper-reviewer`：复核修改质量。
- `nature-polishing`：润色被指出的问题段落。
- `nature-citation`：检查引用。

## 注意

- Pandoc 导出的 Word 用于审阅，不保证封面、页眉、目录、参考文献格式和最终 PDF 完全一致。
- 如果导师要求看格式，请发 PDF；如果导师要批注文字，请发 Word。
- 不要直接在 Word 里定稿。
- 不要让 AI 根据导师意见编造数据、实验结果或引用。
- 正式提交前仍以 LaTeX 编译出的 PDF 和学校/学院要求为准。
