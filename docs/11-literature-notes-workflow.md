# 文献笔记工作流

本文档说明如何在论文项目中系统化管理文献阅读笔记，让 AI 辅助整理、笔记结构化、写作时直接引用。

---

## 核心流程

```text
1. 找文献 → 2. AI 读文献写笔记 → 3. 笔记放入项目 → 4. 写论文时查阅 → 5. 报错交给 AI 修复
```

---

## 第 1 步：把文献放进 Zotero

在 Zotero 中建立专用 Collection：

```text
references
```

将需要精读的文献放入该 Collection，确保每篇文献都有：

- 完整的题录信息（标题、作者、年份、期刊、DOI）
- 对应的 PDF 附件
- Better BibTeX 生成的 Citation key（如 `Mandal2012StageSpecific`）

---

## 第 2 步：让 AI 按模板写笔记

使用 `nature-reader` skill，给 AI 的提示词如下：

```text
阅读这篇论文，按以下模板整理文献笔记：

论文标题：
Citation key：
作者：
年份：
期刊/会议：
DOI：
Zotero 链接：
PDF 文件：

研究问题：

方法与数据：

主要结论：

可引用观点：
- 观点：
- 证据：
- 原文位置：第 x 页 / Section x
- 可用于论文哪一节：

局限性：

与本论文的关系：

备注：

按这个格式整理笔记，每篇文献一个笔记。
```

AI 会基于 PDF 内容自动提取并填充上述字段。

---

## 第 3 步：将笔记放入项目

### 3.1 笔记存放位置

笔记统一存放在学术写作项目的 `docs/notes/` 目录下：

```text
MyPaper/
  docs/
    notes/
      literature-note-template.md    ← 笔记模板
      mandal2012-stage-specific-differentiation.md   ← 单篇文献笔记
      ...
```

每篇文献对应一个笔记文件，文件命名规则：

```text
{citation-key}.md
```

例如 `Mandal2012StageSpecific` 对应的笔记文件为 `mandal2012-stage-specific-differentiation.md`。

### 3.2 让 Codex 自动放置

在 Codex / Claude Code 中直接说：

```text
将这篇文献笔记保存到 docs/notes/{citation-key}.md
```

Codex 会自动在项目目录下创建文件并填入内容。

### 3.3 笔记预览

在 VS Code 中打开 `docs/notes/` 目录，可以直接预览 Markdown 格式的文献笔记：

- 左侧 Explorer 显示 `docs/notes/` 下的所有笔记文件
- 点击任意 `.md` 文件即可在编辑器中查看结构化笔记
- 笔记按「基本信息 → 研究问题 → 方法与数据 → 主要结论 → 可引用观点」组织

---

## 第 4 步：用文献矩阵总览所有文献

### 4.1 文献矩阵的作用

`docs/literature-matrix.md` 是一个总览表格，汇总你论文中用到的所有文献的关键信息：

| Key | Citation | Research Question | Method / Data | Main Findings | Useful For | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| `mandal2012StageSpecific` | Mandal et al. (2012), Stem Cell Studies, 2:e2 | HepG2 条件培养基是否能促进 hESC 向 definitive endoderm 及肝细胞样细胞分化 | 三种 hESC 细胞系；三阶段诱导；qRT-PCR、免疫荧光、流式细胞术、糖原染色、白蛋白分泌、尿素生成 | HepG2-CM 可诱导 definitive endoderm，并获得具有部分肝细胞表型和功能的 HLC；但成熟度仍有限 | 结论研究背景；诱导分化方法依据；讨论和局限性 | 文献笔记 |

### 4.2 维护方式

每新增一篇文献笔记后，在矩阵中新增一行：

```text
使用 nature-reader，阅读这篇论文，按 docs/notes/literature-note-template.md 的模板整理笔记，
保存为 docs/notes/{citation-key}.md。
同时更新 docs/literature-matrix.md 中对应行。
```

这样「单篇详细笔记 + 全局矩阵总览」形成双层文献管理体系：

- **写综述前**：先看 `literature-matrix.md`，把握整体脉络
- **写具体段落时**：打开对应 `docs/notes/{key}.md`，提取可引用观点和改写草稿

---

## 第 5 步：编译论文

### 5.1 在 VS Code 中编译

打开 `paper/main.tex`，点击右上角按钮：

- **运行按钮**（▶）：编译生成 PDF
- **预览按钮**：在右侧预览生成的 PDF

编译命令：

```powershell
cd paper
latexmk -xelatex main.tex
```

### 5.2 常见报错处理

如果编译报错，直接将错误信息丢给 Codex：

```text
编译报错：xxx
请修复 paper/main.tex 或相关章节文件。
```

Codex 会自动定位问题并修复。

---

## 提示词模板汇总

### 整理单篇文献笔记

```text
使用 nature-reader，阅读这篇论文，按 docs/notes/literature-note-template.md 的模板整理笔记，
保存为 docs/notes/{citation-key}.md。
同时更新 docs/literature-matrix.md 中对应行。
```

### 批量整理多篇文献

```text
我已经在 Zotero 的 references Collection 中新增了以下文献：
- {citation-key-1}
- {citation-key-2}
- {citation-key-3}

请依次阅读每篇论文，按模板生成笔记并存入 docs/notes/，
同时更新 docs/literature-matrix.md。
```

### 写文献综述时引用

```text
我要写第 2 章「相关理论与文献综述」的 2.1 节。
请查阅 docs/notes/ 和 docs/literature-matrix.md，
提取与该节主题相关的文献观点，并给出可改写进论文的句子草稿。
引用必须使用 docs/references.bib 中的 citation key。
```

---

## 文件清单

| 文件 | 作用 |
|------|------|
| `docs/notes/literature-note-template.md` | 单篇文献笔记模板 |
| `docs/notes/{citation-key}.md` | 各篇文献的详细笔记 |
| `docs/literature-matrix.md` | 所有文献的总览矩阵 |
| `docs/references.bib` | Zotero 导出的参考文献源 |
| `paper/main.tex` | 论文主文件 |

---

## 注意事项

- 不要编造文献、DOI、页码、数据和实验结果
- 每篇精读论文都应该有对应的笔记文件
- 笔记文件命名必须与 BibTeX citation key 对应，方便交叉引用
- 写论文时优先查阅已有笔记，避免重复阅读 PDF
- 定期同步 `docs/references.bib`（Zotero Better BibTeX 自动导出）
