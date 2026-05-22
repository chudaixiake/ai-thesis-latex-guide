# ECUST Master Thesis AI LaTeX Guide

面向华东理工大学硕士学位论文写作的 LaTeX、Zotero、Codex / Claude Code 项目化工作流示例。内容包括：

- TeX Live 安装与环境检查
- VS Code / LaTeX Workshop 配置
- Zotero + Better BibTeX 管理参考文献
- Codex / Claude Code 辅助写作流程
- Codex skills 安装与调用流程
- 一个面向华理硕士论文场景的原创 LaTeX 模板骨架
- 一键拉取学校模板仓库并改写占位内容的脚本
- 一键创建完整论文项目目录的脚本

> 本项目不是华东理工大学官方发布页，不代表学校或学院的最终格式要求。仓库内置 `template/` 是原创教学骨架；如果需要使用与 `blanche07/ecust-master-thesis-latex` 相同格式，请运行本项目提供的拉取脚本生成本地模板。正式提交前请以研究生院、学院和导师给出的最新要求为准。若你基于学校或他人的开源模板改造论文，请遵守对应许可证并保留必要署名。

## 快速开始

1. 安装 TeX Live，推荐完整安装。
2. 安装 VS Code 和 LaTeX Workshop 插件。
3. 安装 Zotero 和 Better BibTeX。
4. 安装论文写作相关 Codex skills。
5. 用 Zotero 导出 `template/references.bib`。
6. 如果要使用学校模板仓库的格式，运行：

```powershell
powershell -ExecutionPolicy Bypass -File scripts/prepare-ecust-template.ps1
```

该命令会生成：

```text
template/ecust-master-thesis/
```

7. 根据学院要求修改题目、学院、专业、导师等信息。
8. 进入模板目录编译：

```powershell
cd template
latexmk -xelatex main.tex
```

如果使用脚本生成的学校模板格式：

```powershell
cd template\ecust-master-thesis
latexmk -xelatex template.tex
```

如果你想直接创建完整论文项目：

```powershell
powershell -ExecutionPolicy Bypass -File scripts/init-thesis-project.ps1 -Destination D:\GraduationThesis -WithEcustTemplate
```

## 项目结构

```text
docs/       教程文档
scaffold/   可复制的完整论文项目骨架
scripts/    环境检查脚本
template/   原创 LaTeX 论文模板骨架
```

`template/ecust-master-thesis/` 是本地生成目录，不提交到本仓库。它来自 `blanche07/ecust-master-thesis-latex`，用于保持学校模板仓库格式一致。

## 推荐阅读顺序

1. [安装 TeX Live](docs/01-install-texlive.md)
2. [配置 VS Code 与 LaTeX Workshop](docs/02-vscode-latex-workshop.md)
3. [配置 Zotero 与 Better BibTeX](docs/03-zotero-better-bibtex.md)
4. [用 Codex 或 Claude Code 写论文](docs/04-ai-writing-workflow.md)
5. [常见编译问题](docs/05-troubleshooting.md)
6. [安装和使用 Codex Skills](docs/06-codex-skills.md)
7. [华理硕士论文项目建议](docs/07-ecust-master-thesis-workflow.md)
8. [一键创建论文项目](docs/08-one-command-thesis-project.md)

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
