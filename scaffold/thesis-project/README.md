# Academic Writing Project

这是一个面向**通用学术写作**的项目骨架，用于配合 Codex 或 Claude Code 完成论文/文章写作、文献管理、LaTeX 编译和版本管理。适用于学位论文、期刊论文、会议论文或任何 LaTeX 文档。

> **内置默认模板基于华东理工大学硕士论文格式（仅作为初始化占位示例）。生成项目骨架后，把你的学校或期刊 LaTeX 模板交给 Codex 即可自动适配。**

## 目录

```text
data/
  raw/          原始数据，不直接修改。
  processed/    清洗或处理后的数据。
docs/           配置、大纲、笔记、参考文献。
  workflow/     AI 写作流程、质量门禁和工作日志模板。
  worklog/      每轮重要写作或修订的过程记录。
figures/        图片和导出图表。
paper/          LaTeX 主项目。
scripts/        数据处理和绘图脚本。
word/           Word 格式映射规格。
```

## 第一次使用

1. 填写 `docs/thesis-config.md`（题目、目标、研究问题、方法等，文件中有填写示例）。
2. **替换模板**：把你目标学校或期刊的 LaTeX 模板给 Codex，让它适配 `paper/template/`。
3. 修改 `docs/outline.md`。
4. 在 Zotero 中建立文献 Collection，并用 Better BibTeX 自动导出到 `docs/references.bib`。
5. 让 Codex 或 Claude Code 按 `docs/ai-skills-workflow.md` 和 `docs/workflow/writing-pipeline.md` 工作。
6. 重大写作、模板适配、审稿修改前，在 `docs/worklog/` 建立本轮工作日志。
7. 正式排版优先编译 `paper/main.tex`。

## 配置页眉

`paper/main.tex` 中的页眉通过两个命令控制：

```latex
\newcommand{\SchoolName}{你的学校名称}
\newcommand{\ThesisType}{硕士学位论文}
```

修改为你的实际学校名称和学位类型即可。如果你的学校使用不同的页眉格式，替换 `fancypagestyle` 的内容。

## 替换模板（生成骨架之后）

项目骨架已生成后，这是最关键的一步：

```text
我要使用 [XX大学学位论文 / XX期刊] 的 LaTeX 模板，
模板文件在 [路径]，请帮我调整 paper/template/ 以匹配该模板格式，
并确保 main.tex 正确引用该模板。
```

## 导出 Word 给审稿人批注

**Windows：**

```powershell
powershell -ExecutionPolicy Bypass -File scripts/export-review-docx.ps1
```

**macOS / Linux：**

```bash
bash scripts/export-review-docx.sh
```

默认输出：

```text
docs/export/review-draft.docx
```

### Word 导出的已知限制

Pandoc 转换 Word 时，页眉页脚、中文字体、目录样式和标题编号会丢失或不完全。`word/ecust-word-format-spec.md` 提供了格式映射规格。导师批注的重点是文字内容，最终格式以 LaTeX/PDF 为准。

返回的批注版 Word 放到：

```text
docs/review/
```

然后让 Codex 或 Claude Code 根据 `docs/word-review-workflow.md` 整理修改清单并改回 LaTeX。

Word 审阅稿格式可参考：

```text
word/ecust-word-format-spec.md
```

> 换了新模板后，可以让 Codex 根据你的实际模板重新提取 Word 格式映射。

## 章节写作指引

`paper/chapters/` 下的每个 .tex 文件都包含注释说明：

- 每章建议的字数范围
- 每个小节应写什么内容
- 引用和图表的使用示例

按照注释中的指引填写内容即可。

## 常用命令

```powershell
cd paper
latexmk -xelatex main.tex
```

如需单独测试占位模板：

```powershell
cd paper\template
latexmk -xelatex template.tex
```

`paper\template` 由初始化脚本从教程仓库复制而来作为占位。**请替换为你自己的实际模板。** 字体、页边距、页眉、标题、目录和参考文献格式属于格式关键部分，不要让 AI 随意修改。

## 给 Codex / Claude Code 的常用指令

```text
根据 docs/thesis-config.md 和 docs/outline.md，帮我细化大纲。
```

```text
使用 academic-paper 和 nature-writing，直接修改 paper/chapters/01-introduction.tex。
目标：补全研究背景和研究意义。
限制：不要编造引用；没有来源的位置用 [需要引用] 标记。
```

```text
请按 docs/workflow/writing-pipeline.md 为本轮修改建立 docs/worklog/YYYY-MM-DD-intro-draft/summary.md，
然后只修改 paper/chapters/01-introduction.tex，并按 docs/workflow/quality-gates.md 做交付检查。
```
