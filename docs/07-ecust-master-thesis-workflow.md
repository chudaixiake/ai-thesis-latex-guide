# 华理硕士论文项目建议

本文档面向华东理工大学硕士学位论文写作场景，说明如何把 LaTeX、Zotero 和 AI 辅助写作放到一个可维护的项目里。

## 重要声明

- 本项目不是华东理工大学官方发布页。
- 本项目内置 `format/template/ecust-master/` 作为华理硕士 LaTeX 格式源。
- 初始化生成 `D:\GraduationThesis` 后，正式论文排版以 `paper/template/template.tex` 为主入口。
- 页面格式、封面、扉页、页眉、目录、参考文献等最终要求，应以研究生院、学院和导师发布的最新文件为准。
- 如果使用第三方开源模板，应遵守对应许可证并保留必要来源说明。

## 推荐目录

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
  paper/
    main.tex
    chapters/
      01-introduction.tex
      02-literature.tex
      03-method.tex
      04-analysis.tex
      05-conclusion.tex
  figures/
  data/
    raw/
    processed/
  scripts/
```

## 华理硕士论文常见内容块

不同学院可能有细节差异，但通常需要准备：

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
- 附录或攻读学位期间成果，按学院要求添加

## 推荐章节骨架

```text
第 1 章 绪论
第 2 章 相关理论与文献综述
第 3 章 研究设计或方法
第 4 章 结果与分析
第 5 章 总结与展望
```

如果你的专业是工程、计算机、控制、材料、化工、经管等方向，章节名称可以按研究对象调整，但建议保持“背景 -> 文献 -> 方法 -> 结果 -> 总结”的逻辑。

## LaTeX 编译建议

华理中文硕士论文建议使用 XeLaTeX：

```powershell
cd paper
latexmk -xelatex main.tex
```

如果要单独重新生成华理硕士论文格式模板，在本教程项目根目录运行：

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

参考文献建议使用：

```latex
\usepackage[backend=biber,style=gb7714-2015,gbalign=left,gbnamefmt=lowercase]{biblatex}
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
GraduationThesis
```

用 Better BibTeX 自动导出为：

```text
docs/references.bib
```

LaTeX 中引用：

```latex
\addbibresource{../docs/references.bib}
```

正文引用：

```latex
已有研究指出……\cite{sample2024}。
```

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
目标：补全“研究背景”和“研究意义”。
依据：docs/thesis-config.md、docs/outline.md、docs/references.bib。
限制：不要编造引用；没有来源的位置用 [需要引用] 标记。
```

## 提交前检查

- 所有 `\cite{}` 都能在 `references.bib` 中找到。
- 图表编号、标题和正文引用一致。
- 摘要、关键词、中英文题名已经更新。
- 目录能正确生成。
- 编译至少完整跑过一次 `latexmk -xelatex main.tex`。
- 格式要求与学院最新通知一致。
