# AI Thesis LaTeX Guide

用 Codex 或 Claude Code 辅助写毕业论文的一套项目化工作流示例。内容包括：

- TeX Live 安装与环境检查
- VS Code / LaTeX Workshop 配置
- Zotero + Better BibTeX 管理参考文献
- Codex / Claude Code 辅助写作流程
- 一个原创的中文学位论文 LaTeX 模板骨架

> 本项目的 LaTeX 模板是通用教学模板，不复制任何学校模板源码。若你基于学校或他人的开源模板改造论文，请遵守对应许可证并保留必要署名。

## 快速开始

1. 安装 TeX Live，推荐完整安装。
2. 安装 VS Code 和 LaTeX Workshop 插件。
3. 安装 Zotero 和 Better BibTeX。
4. 用 Zotero 导出 `template/references.bib`。
5. 进入模板目录编译：

```powershell
cd template
latexmk -xelatex main.tex
```

## 项目结构

```text
docs/       教程文档
scripts/    环境检查脚本
template/   原创 LaTeX 论文模板骨架
```

## 推荐阅读顺序

1. [安装 TeX Live](docs/01-install-texlive.md)
2. [配置 VS Code 与 LaTeX Workshop](docs/02-vscode-latex-workshop.md)
3. [配置 Zotero 与 Better BibTeX](docs/03-zotero-better-bibtex.md)
4. [用 Codex 或 Claude Code 写论文](docs/04-ai-writing-workflow.md)
5. [常见编译问题](docs/05-troubleshooting.md)

## 环境检查

```powershell
powershell -ExecutionPolicy Bypass -File scripts/check-latex-env.ps1
```

需要看到这些命令都存在：

```text
xelatex
biber
latexmk
kpsewhich
```

## 许可

本教程和模板骨架使用 MIT License 发布。第三方工具、字体、插件和学校模板各自遵守其原始许可证。
