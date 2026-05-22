# 配置 VS Code 与 LaTeX Workshop

VS Code 适合和 Codex / Claude Code 一起管理论文项目。TeXstudio 也可以用，但不是必须。

## 安装

1. 安装 VS Code。
2. 在扩展市场安装 `LaTeX Workshop`。
3. 确认 TeX Live 已在 `Path` 中。

## 推荐设置

在 VS Code 的 `settings.json` 中加入：

```json
{
  "latex-workshop.latex.recipe.default": "latexmk (xelatex)",
  "latex-workshop.latex.autoBuild.run": "onSave",
  "latex-workshop.view.pdf.viewer": "tab",
  "latex-workshop.latex.clean.fileTypes": [
    "*.aux",
    "*.bbl",
    "*.bcf",
    "*.blg",
    "*.fdb_latexmk",
    "*.fls",
    "*.log",
    "*.out",
    "*.run.xml",
    "*.synctex.gz",
    "*.toc",
    "*.xdv"
  ]
}
```

## 手动编译

```powershell
cd template
latexmk -xelatex main.tex
```

如果不用 `latexmk`，手动顺序是：

```powershell
xelatex main.tex
biber main
xelatex main.tex
xelatex main.tex
```
