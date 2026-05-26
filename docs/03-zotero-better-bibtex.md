# 配置 Zotero 与 Better BibTeX

Zotero 负责管理文献和 PDF，LaTeX 项目只需要 `.bib` 引用数据库。

## 推荐结构

在 Zotero 左侧新建一个分类：

```text
references
```

把论文会用到的文献拖到这个分类中。PDF 可以继续由 Zotero 管理，不需要复制到 LaTeX 项目里。

## 安装 Better BibTeX

Better BibTeX 用来生成稳定的 citation key，并自动导出 `.bib` 文件。

安装后，在 Zotero 中右键 `references`：

```text
Export Collection...
```

选择：

```text
Better BibLaTeX
```

勾选：

```text
Keep updated
```

保存为：

```text
template/references.bib
```

## 在正文中引用

如果 `references.bib` 中有：

```bibtex
@article{zhang2024example,
  title = {Example Title},
  author = {Zhang, San},
  year = {2024}
}
```

正文中使用：

```latex
相关研究指出……\cite{zhang2024example}。
```

## 注意

- 不要手动频繁改自动导出的 `references.bib`。
- 修改文献信息应优先在 Zotero 中完成。
- 写作时不要让 AI 编造 citation key；先确认 key 存在于 `.bib` 文件。
