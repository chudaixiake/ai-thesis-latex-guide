# AI 辅助论文写作项目指南

本文档说明如何把 LaTeX、Zotero 和 AI 辅助写作（Codex / Claude Code）放到一个可维护的项目里，形成完整的论文写作工作流。

**本项目是通用写作流程指南，不绑定任何特定学校的模板。** 内置默认模板基于华东理工大学硕士论文格式，但你可以随时换成其他模板——只需要告诉 Codex / Claude Code 即可。

## 重要声明

- 本项目不是任何学校官方发布的论文格式包。
- 本项目内置 `format/template/ecust-master/` 作为 **默认 LaTeX 格式示例**（华东理工大学硕士论文）。
- 初始化生成项目后，正式论文排版以 `paper/template/template.tex` 为主入口。
- 页面格式、封面、扉页、页眉、目录、参考文献等最终要求，应以你所在学校研究生院、学院和导师发布的最新文件为准。
- 如果使用第三方开源模板，应遵守对应许可证并保留必要来源说明。
- **想用别的学校的模板？直接告诉 Codex 就行：**

```text
我要使用 XX大学 的硕士论文 LaTeX 模板，
请帮我调整 paper/template/ 下的文件以匹配该模板的格式要求。
```

---

## 论文项目推荐目录

```text
GraduationThesis/
  AGENTS.md
  README.md
  docs/
    thesis-config.md
    outline.md
    literature-matrix.md
    references.bib
    ai-skills-workflow.md
    word-review-workflow.md
    notes/
      literature-note-template.md
      {citation-key-1}.md
      {citation-key-2}.md
      ...
    export/
    review/
  paper/
    main.tex
    chapters/
      01-introduction.tex
      02-literature.tex
      03-method.tex
      04-analysis.tex
      05-conclusion.tex
    template/
  figures/
  data/
    raw/
    processed/
  scripts/
```

不同学校、学位类型的内容块可能不同，但通常需要准备：

## 论文常见内容块

- 中文题名
- 英文题名
- 中文摘要
- 英文摘要
- 中文关键词
- 英文关键词
- 目录
- 正文章节
- 参考文献
- 致谢
- 附录或攻读学位期间成果（按学校要求添加）

> 以上内容块因学校而异。如果你的学校有特殊要求（如不需要英文题名、或需要额外的"创新点"章节），告诉 Codex 即可自动适配。

## 推荐章节骨架

```text
第 1 章 绪论
第 2 章 相关理论与文献综述
第 3 章 研究设计或方法
第 4 章 结果与分析
第 5 章 总结与展望
```

如果你的专业是工程、计算机、控制、材料、化工、经管等方向，章节名称可以按研究对象调整，但建议保持"背景 -> 文献 -> 方法 -> 结果 -> 总结"的逻辑。

## LaTeX 编译建议

中文论文建议使用 XeLaTeX：

```powershell
cd paper
latexmk -xelatex main.tex
```

### 使用默认模板（ECUST 硕士）

如果要生成默认的 ECUST 硕士论文格式模板，在本教程项目根目录运行：

```powershell
powershell -ExecutionPolicy Bypass -File scripts/prepare-ecust-template.ps1 -Destination D:\GraduationThesis\paper\template -Force
```

生成目录：

```text
D:\GraduationThesis\paper\template\
```

编译：

```powershell
cd D:\GraduationThesis\paper\template
latexmk -xelatex template.tex
```

这个脚本会从项目内置标准模板目录复制文件，并把示例题目、摘要、正文、致谢等占位内容替换为更通用的论文占位文本；格式相关 LaTeX 结构、字体文件和参考文献设置保持不变。

默认格式源：

```text
D:\ai-thesis-latex-guide\format\template\ecust-master
```

### 切换到其他学校的模板

如果你想用自己的学校模板，只需对 Codex 说：

```text
我使用的是 XX大学 的 XX 学位论文 LaTeX 模板，
模板文件在 [路径]。
请帮我将 paper/template/ 调整为匹配该模板的格式，
并确保 main.tex 正确引用该模板。
```

Codex 会自动处理模板切换，无需手动修改大量配置。

### 参考文献设置

中文论文推荐引用格式：

```latex
\usepackage[backend=biber,style=gb7714-2015,gbalign=left,gbnamefmt=lowercase]{biblatex}
```

如果学校要求其他引用格式（如 APA、IEEE），同样告诉 Codex：

```text
我的学校要求使用 APA 引用格式，请修改 biblatex 设置。
```

手动编译顺序：

```powershell
xelatex main.tex
biber main
xelatex main.tex
xelatex main.tex
```

## Zotero 配置

在 Zotero 中建立专用 Collection：

```text
references
```

用 Better BibTeX 自动导出为：

```text
docs/references.bib
```

详细步骤参见 [12-zotero-auto-update-bib](./12-zotero-auto-update-bib.md)。

LaTeX 中引用：

```latex
\addbibresource{../docs/references.bib}
```

正文引用：

```latex
已有研究指出……\cite{sample2024}。
```

## 文献笔记组织

建议为每篇精读论文建立独立笔记，统一存放在 `docs/notes/` 目录下。

**笔记模板：** `docs/notes/literature-note-template.md` 包含以下模块：
- 基本信息（标题、作者、年份、DOI、Zotero 链接等）
- 研究问题概括
- 方法与数据梳理
- 主要结论提取
- 可引用观点（含原文位置和改写草稿）
- 重要公式 / 模型 / 判据
- 与其它文献的关系
- 待办 / 疑问

**推荐流程：**

1. 用 `nature-reader` 阅读论文，按模板生成笔记
2. 笔记文件命名为 `docs/notes/{citation-key}.md`
3. 在 `docs/literature-matrix.md` 中新增一行，记录该文献的关键信息

**示例 prompt：**

```text
使用 nature-reader，阅读这篇论文，按 docs/notes/literature-note-template.md 的模板整理笔记，
保存为 docs/notes/{citation-key}.md。
同时更新 docs/literature-matrix.md 中对应行。
```

这个流程确保每篇文献都有结构化笔记，写文献综述时可以直接查阅和引用。详细流程参见 [11-literature-notes-workflow](./11-literature-notes-workflow.md)。

## Codex / Claude Code 使用方式

建议在论文项目根目录放 `AGENTS.md`，固定规则：

```md
- 论文语言使用中文，风格正式、清晰、克制。
- 不编造文献、数据、实验结果、页码、DOI 和学校要求。
- 写作前参考 docs/ai-skills-workflow.md。
- 引用必须来自 docs/references.bib 或用户明确提供的材料。
- 修改 LaTeX 后尽量运行 latexmk -xelatex main.tex。
```

典型提示：

```text
使用 academic-paper 和 nature-writing，直接修改 paper/chapters/01-introduction.tex。
目标：补全"研究背景"和"研究意义"。
依据：docs/thesis-config.md、docs/outline.md、docs/references.bib。
限制：不要编造引用；没有来源的位置用 [需要引用] 标记。
```

## 提交前检查

- 所有 `\cite{}` 都能在 `references.bib` 中找到。
- 图表编号、标题和正文引用一致。
- 摘要、关键词、中英文题名已经更新（根据学校要求）。
- 目录能正确生成。
- 编译至少完整跑过一次 `latexmk -xelatex main.tex`。
- 格式要求与学校最新通知一致。
