# Word Review Workflow

导师如果习惯使用 Word 批注，本项目采用“LaTeX 主稿 + Word 审阅稿”的往返流程。

## 基本原则

- LaTeX 是正式主稿，最终排版和提交以 `paper/main.tex` 及其章节文件为准。
- Word 版只用于导师批注和阶段审阅，不作为最终排版源文件。
- 导师返回的 Word 批注不要直接覆盖 LaTeX；先整理成修改清单，再逐条改回 LaTeX。
- Word 审阅稿的格式规格参考 `word/ecust-word-format-spec.md`，该规格从 LaTeX 模板参数提取（默认基于 ECUST 硕士论文模板）。

## 目录

```text
docs/export/   导出给导师看的 Word 或 PDF
docs/review/   导师返回的批注版 Word
```

## 导出 Word 审阅稿

**Windows：**

```powershell
powershell -ExecutionPolicy Bypass -File scripts/export-review-docx.ps1
```

**macOS / Linux：**

```bash
bash scripts/export-review-docx.sh
```

默认生成：

```text
docs/export/review-draft.docx
```

### 已知限制

Pandoc 将 LaTeX 转为 Word 时，页眉页脚、中文字体、目录样式和标题编号会丢失或不完全。`word/ecust-word-format-spec.md` 提供了格式映射规格。导师批注的重点是文字内容，最终格式以 LaTeX/PDF 为准。

## 导师批注回来后

把文件放入：

```text
docs/review/
```

然后让 Codex 或 Claude Code 整理批注：

```text
请读取 docs/review/supervisor-comments-YYYYMMDD.docx，整理导师所有批注和修改建议，生成 docs/revision-roadmap-YYYYMMDD.md。
```

再按清单修改 LaTeX：

```text
根据 docs/revision-roadmap-YYYYMMDD.md，逐条修改 paper/chapters 中对应章节。不要改动未提到的内容。
```

## 适合的 AI skills

- `nature-response`：整理导师反馈和修改清单。
- `academic-paper-reviewer`：按硕士论文标准复查改稿。
- `nature-polishing`：润色被导师指出的问题段落。
- `nature-citation`：检查引用。
