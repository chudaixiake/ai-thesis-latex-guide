# 安装 TeX Live

毕业论文建议安装 TeX Live 完整版。相比精简发行版，完整版更少遇到缺包问题，适合中文、参考文献、图表和学校模板。

## Windows 推荐方式

1. 打开 TeX Live 官方安装页面：<https://tug.org/texlive/>
2. 下载 Windows 网络安装器 `install-tl-windows.exe`。
3. 安装方案选择 `scheme-full`。
4. 安装路径建议使用：

```text
D:\texlive\2026
```

如果你安装的是其他年份，把年份换成对应目录即可。

## 配置 Path

安装完成后，把 TeX Live 的可执行目录放到系统 `Path` 前面：

```text
D:\texlive\2026\bin\windows
```

如果电脑里已有 MiKTeX，TeX Live 的路径应排在 MiKTeX 前面，避免命令混用。

## 检查命令

打开新的 PowerShell：

```powershell
where xelatex
where biber
where latexmk
xelatex --version
biber --version
latexmk -version
```

`where` 输出的第一条应来自 TeX Live，例如：

```text
D:\texlive\2026\bin\windows\xelatex.exe
```

## 为什么用 XeLaTeX

中文论文通常需要中文字体、中文断行和学校模板样式。XeLaTeX 对系统字体和中文支持更直接，适合与 `ctex`、`xeCJK` 配合使用。
