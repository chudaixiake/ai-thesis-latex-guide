# Zotero 自动更新参考文献

本文档说明如何通过 Better BibTeX 让 Zotero 自动将文献导出为 LaTeX 可引用的 `.bib` 文件，实现「添加文献到 Zotero → `.bib` 自动更新 → Codex 直接引用」的闭环流程。

---

## 第 1 步：新建论文分类

在 Zotero 左侧「我的库」中，右键点击空白处，选择**新建分类**：

```text
references
```

这个分类专门用来存放你要写的这篇论文会用到的所有参考文献。

---

## 第 2 步：命名分类为 references

新建的分类命名为 `references`，后续所有与当前论文相关的文献都拖入该分类。

---

## 第 3 步：配置自动导出

右键点击 `references` 分类 → 选择**导出分类**：

1. 在弹出的对话框中，格式选择 **Better BibLaTeX**
2. 勾选 **保持更新（Keep updated）**
3. 保存路径选择论文项目的 `docs\` 文件夹
4. 文件名设为 `references.bib`

此时 `D:\MyPaper\docs\` 目录下会生成一个 `references.bib` 文件——这就是 LaTeX 引用参考文献的数据源。

---

## 第 4 步：自动同步

完成以上设置后，只要在 Zotero 的 `references` 分类中**新增或修改任何文献**，`references.bib` 就会自动更新。不需要手动重新导出。

---

## 第 5 步：Codex 引用文献

当 `references.bib` 就绪后，在 Codex / Claude Code 中可以直接引用文献。例如：

```text
使用 academic-paper 和 nature-writing，
基于 docs/references.bib 和 docs/notes/ 下已有的笔记，
帮我写第 2 章文献综述。
限制：只引用 docs/references.bib 中存在的 citation key；
没有来源的位置用 [需要引用] 标记。
```

Codex 会结合你的笔记和 `.bib` 数据库来写作，所有 `\cite{}` 都指向真实存在的文献条目。

---

## 完整操作流程图

```text
Zotero 新建 references 分类
        ↓
  添加 PDF / 题录到该分类
        ↓
  右键 → 导出分类 → Better BibLaTeX → 勾选"保持更新"
        ↓
  保存为 D:\MyPaper\docs\references.bib
        ↓
  之后每新增一篇文献 → .bib 自动更新
        ↓
  Codex 读取 .bib + 笔记 → 写论文并正确引用
```

---

## 常见问题

### Q：导出后找不到 `.bib` 文件？

确认保存路径是否正确指向了论文项目的 `docs\` 文件夹。可以在文件资源管理器中直接打开检查。

### Q：新增文献后 `.bib` 没有变化？

确保导出时勾选了 **Keep updated（保持更新）**。如果未勾选，需要重新执行一次导出操作。

### Q：citation key 不满意怎么办？

Better BibTeX 默认按 `[author][year][title]` 格式生成 key（如 `Mandal2012StageSpecific`）。可以在 Zotero 设置中自定义 key 格式，也可以手动编辑单个条目的 key。

### Q：可以多个项目共用同一个 `.bib` 吗？

可以。每个项目的 AGENTS.md 中指定自己的 `\addbibresource{../docs/references.bib}` 路径即可。建议每个项目维护独立的 `references.bib`，避免混淆。

---

## 相关文档

- [03-zotero-better-bibtex](./03-zotero-better-bibtex.md) —— Zotero 与 Better BibTeX 安装基础
- [11-literature-notes-workflow](./11-literature-notes-workflow.md) —— 文献笔记工作流
- [06-codex-skills](./06-codex-skills.md) —— Codex Skills 调用指南
