# 一键创建学术写作项目

本教程提供了一个学术写作项目骨架，目标是让使用者不用手动配置目录、`AGENTS.md`、大纲、章节文件和 AI skills 流程。创建后，只需要让 Codex 或 Claude Code 按项目文件工作。

## 适用场景

- **学位论文**（本科 / 硕士 / 博士，任何学校）。
- **期刊论文**（任何学科，任何期刊模板）。
- **会议论文、技术报告或其他 LaTeX 文档**。
- 使用 LaTeX 管理正文排版。
- 使用 Zotero + Better BibTeX 管理参考文献。
- 使用 Codex 或 Claude Code 辅助写作、润色、查引用、做图表和审稿。

> **内置默认模板为华东理工大学硕士论文格式（仅作为初始化占位示例）。生成项目骨架后，你可以替换为自己学校或期刊的任何 LaTeX 模板——告诉 Codex 即可。**

## 一键初始化

在本教程仓库根目录运行：

```powershell
cd D:\ai-thesis-latex-guide
powershell -ExecutionPolicy Bypass -File scripts/init-thesis-project.ps1 -Destination D:\MyPaper
```

这个命令会：

1. 复制 `scaffold/thesis-project/` 到目标目录，生成通用项目骨架。
2. 创建 `docs/`、`paper/`、`data/`、`figures/`、`scripts/`、`word/` 等目录。
3. 写入 `AGENTS.md`、大纲、章节占位、AI skills 流程、Word 审阅流程。
4. 从 `format\template\ecust-master` 复制默认格式模板到 `paper\template`（**这只是初始占位**）。
5. 初始化 Git 并提交第一版。

### 替换为你自己的模板（关键步骤）

项目骨架生成完成后，**下一步就是把你的实际模板交给 Codex**。这是整个工作流的核心设计：先有结构，再适配格式。

#### 学位论文模板

```text
我要使用 XX大学 的 XX 学位论文 LaTeX 模板，
模板文件在 [路径]，请帮我调整 paper/template/ 的内容以匹配该模板的格式要求，
并确保 main.tex 正确引用该模板。
```

#### 期刊投稿模板

```text
我要向 XX期刊 投稿，期刊的 LaTeX 模板在 [路径]。
请帮我调整 paper/template/ 以匹配该期刊的格式，
包括页面设置、参考文献样式（如 APA / IEEE）、标题格式等，
并确保 main.tex 正确引用该模板。
```

Codex 会自动处理模板切换，包括：
- 复制模板文件到 `paper/template/`
- 调整 `main.tex` 的引用关系
- 修改参考文献样式配置
- 适配页面尺寸、页眉页脚等

如果目标目录已经有文件，并且你明确想覆盖同名骨架文件：

```powershell
powershell -ExecutionPolicy Bypass -File scripts/init-thesis-project.ps1 -Destination D:\MyPaper -Force
```

## 生成的目录

```text
MyPaper/
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
    export/
    review/
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
      template.tex
      bib_template.bib
      KaiTi/
      SimHei/
      SimSun/
  figures/
  data/
    raw/
    processed/
  scripts/
  word/
    ecust-word-format-spec.md
```

## 每个文件的作用

- `AGENTS.md`：告诉 Codex / Claude Code 每次进入项目后应该遵守的规则。
- `docs/thesis-config.md`：论文题目、专业、导师、研究问题、方法、格式要求。
- `docs/outline.md`：论文大纲或文章结构。
- `docs/literature-matrix.md`：文献矩阵。
- `docs/references.bib`：Zotero Better BibTeX 自动导出的参考文献库。
- `docs/ai-skills-workflow.md`：写论文时应该调用哪些 skills。
- `docs/word-review-workflow.md`：审稿人/导师使用 Word 批注时的往返流程。
- `paper/main.tex`：简化 LaTeX 主文件。
- `word/ecust-word-format-spec.md`：从 LaTeX 模板提取的 Word 格式映射规格（初始基于 ECUST 示例，换模板后需重新提取）。
- `paper/chapters/`：分章节正文。
- `figures/`：图片和导出图表。
- `data/`：原始数据和处理后数据。
- `scripts/`：数据处理、绘图和检查脚本。

## 使用自己的模板格式

> **重要：模板替换应在项目骨架生成之后进行。**

初始化脚本使用内置默认格式源（ECUST 硕士论文模板）作为占位：

```text
D:\ai-thesis-latex-guide\format\template\ecust-master
```

**这不是你的最终模板，只是一个可编译的示例。** 初始化完成后，按上述"替换为你自己的模板"步骤操作即可。

如果后续需要重新生成 `paper\template`（使用默认 ECUST 占位模板）：

```powershell
cd D:\ai-thesis-latex-guide
powershell -ExecutionPolicy Bypass -File scripts/prepare-ecust-template.ps1 -Destination D:\MyPaper\paper\template -Force
```

然后编译：

```powershell
cd D:\MyPaper\paper\template
latexmk -xelatex template.tex
```

脚本会从内置标准模板目录复制文件，并替换题目、摘要、正文示例、致谢等占位内容，但保留格式相关 LaTeX 结构、字体文件和参考文献设置。

如果你的标准模板放在其他位置，可以指定：

```powershell
powershell -ExecutionPolicy Bypass -File scripts/prepare-ecust-template.ps1 `
  -Source D:\YourTemplateFolder `
  -Destination D:\MyPaper\paper\template `
  -Force
```

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
使用 nature-polishing 润色第 2 章，保持中文论文风格，不改变事实和引用。
```

```text
使用 academic-paper-reviewer，审查当前论文结构、论证、方法、引用和格式问题。
```

## 导出 Word 给审稿人批注

```powershell
cd D:\MyPaper
powershell -ExecutionPolicy Bypass -File scripts/export-review-docx.ps1
```

默认生成：

```text
docs/export/review-draft.docx
```

这个 Word 文件用于审稿人/导师批注，不保证与最终 LaTeX PDF 完全同版。

返回的批注版 Word 放到：

```text
docs/review/
```

然后让 Codex 或 Claude Code 处理：

```text
请读取 docs/review/supervisor-comments-YYYYMMDD.docx，整理所有批注和修改建议，生成 docs/revision-roadmap-YYYYMMDD.md。
```

再改回 LaTeX：

```text
根据 docs/revision-roadmap-YYYYMMDD.md，逐条修改 paper/chapters 中对应章节。不要改动未提到的内容。
```

## Zotero 配置

在 Zotero 中新建 Collection：

```text
references
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
D:\MyPaper\docs\references.bib
```

## Git 版本管理

初始化脚本会自动执行：

```powershell
git init
git add .
git commit -m "Initialize academic writing project"
```

以后每完成一个阶段，可以让 Codex 或 Claude Code 提交：

```text
检查当前改动并提交，提交信息说明本次完成了哪一章或哪项配置。
```

## 注意事项

- 不要把 Zotero 的全部 PDF 复制进项目。
- 不要让 AI 编造参考文献、DOI、页码、数据和实验结果。
- 不要在未确认目标最新要求前声称格式已经最终合规。
- 如果使用第三方模板，保留来源和许可证信息。
- **模板替换是生成骨架后的独立步骤，不是初始化时完成的。**
