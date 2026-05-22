# 一键创建论文项目

本教程提供了一个论文项目骨架，目标是让使用者不用手动配置目录、`AGENTS.md`、大纲、章节文件和 AI skills 流程。创建后，只需要让 Codex 或 Claude Code 按项目文件工作。

## 适用场景

- 华东理工大学硕士论文写作。
- 使用 LaTeX 管理论文正文。
- 使用 Zotero + Better BibTeX 管理参考文献。
- 使用 Codex 或 Claude Code 辅助写作、润色、查引用、做图表和审稿。

## 一键初始化

在本教程仓库根目录运行：

```powershell
cd D:\ai-thesis-latex-guide
powershell -ExecutionPolicy Bypass -File scripts/init-thesis-project.ps1 -Destination D:\GraduationThesis
```

如果还想同时拉取 `blanche07/ecust-master-thesis-latex` 的模板格式：

```powershell
cd D:\ai-thesis-latex-guide
powershell -ExecutionPolicy Bypass -File scripts/init-thesis-project.ps1 -Destination D:\GraduationThesis -WithEcustTemplate
```

如果目标目录已经有文件，并且你明确想覆盖同名骨架文件：

```powershell
powershell -ExecutionPolicy Bypass -File scripts/init-thesis-project.ps1 -Destination D:\GraduationThesis -Force
```

## 生成的目录

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
    notes/
  paper/
    main.tex
    README.md
    chapters/
      01-introduction.tex
      02-literature.tex
      03-method.tex
      04-analysis.tex
      05-conclusion.tex
    assets/
    template/
  figures/
  data/
    raw/
    processed/
  scripts/
```

## 每个文件的作用

- `AGENTS.md`：告诉 Codex / Claude Code 每次进入项目后应该遵守的规则。
- `docs/thesis-config.md`：论文题目、专业、导师、研究问题、方法、格式要求。
- `docs/outline.md`：论文大纲。
- `docs/literature-matrix.md`：文献矩阵。
- `docs/references.bib`：Zotero Better BibTeX 自动导出的参考文献库。
- `docs/ai-skills-workflow.md`：写论文时应该调用哪些 skills。
- `paper/main.tex`：简化 LaTeX 主文件。
- `paper/chapters/`：分章节正文。
- `figures/`：论文图片。
- `data/`：原始数据和处理后数据。
- `scripts/`：数据处理、绘图和检查脚本。

## 使用学校模板格式

如果初始化时没有加 `-WithEcustTemplate`，后续也可以手动生成：

```powershell
cd D:\ai-thesis-latex-guide
powershell -ExecutionPolicy Bypass -File scripts/prepare-ecust-template.ps1 -Destination D:\GraduationThesis\paper\template -Force
```

然后编译：

```powershell
cd D:\GraduationThesis\paper\template
latexmk -xelatex template.tex
```

该模板目录来自：

```text
https://github.com/blanche07/ecust-master-thesis-latex
```

脚本会替换题目、摘要、正文示例、致谢等占位内容，但保留格式相关 LaTeX 结构。

## 创建后怎么指挥 Codex 或 Claude Code

第一步，先让 AI 读取项目规则：

```text
请阅读 AGENTS.md、docs/thesis-config.md、docs/outline.md 和 docs/ai-skills-workflow.md，之后按这些规则协助我写论文。
```

第二步，填论文配置：

```text
根据我的题目和研究方向，帮我补全 docs/thesis-config.md，不确定的地方保留为空或标注 [待确认]。
```

第三步，细化大纲：

```text
使用 academic-paper，基于 docs/thesis-config.md，帮我细化 docs/outline.md。
```

第四步，写章节：

```text
使用 academic-paper 和 nature-writing，直接修改 paper/chapters/01-introduction.tex。
目标：补全研究背景和研究意义。
依据：docs/thesis-config.md、docs/outline.md、docs/references.bib。
限制：不要编造引用；没有来源的位置用 [需要引用] 标记。
```

第五步，查引用：

```text
使用 nature-citation，检查 paper/chapters 中所有 citation key 是否存在于 docs/references.bib。
```

第六步，润色和审查：

```text
使用 nature-polishing 润色第 2 章，保持中文硕士论文风格，不改变事实和引用。
```

```text
使用 academic-paper-reviewer，按硕士论文标准审查当前论文结构、论证、方法、引用和格式问题。
```

## Zotero 配置

在 Zotero 中新建 Collection：

```text
GraduationThesis
```

右键导出：

```text
Export Collection...
```

格式选：

```text
Better BibLaTeX
```

勾选：

```text
Keep updated
```

保存到：

```text
D:\GraduationThesis\docs\references.bib
```

## Git 版本管理

初始化脚本会自动执行：

```powershell
git init
git add .
git commit -m "Initialize ECUST thesis project"
```

以后每完成一个阶段，可以让 Codex 或 Claude Code 提交：

```text
检查当前改动并提交，提交信息说明本次完成了哪一章或哪项配置。
```

## 注意

- 不要把 Zotero 的全部 PDF 复制进论文项目。
- 不要让 AI 编造参考文献、DOI、页码、数据和实验结果。
- 不要在未确认学院最新要求前声称格式已经最终合规。
- 如果使用第三方模板，保留来源和许可证信息。
