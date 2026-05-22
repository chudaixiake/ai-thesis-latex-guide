# 常见编译问题

## 找不到 xelatex

现象：

```text
xelatex: command not found
```

处理：

- 确认 TeX Live 已安装。
- 确认 `D:\texlive\2026\bin\windows` 已加入 `Path`。
- 重新打开 PowerShell 或 VS Code。

## 找不到 gb7714-2015

现象：

```text
Package biblatex Error: Style 'gb7714-2015' not found.
```

处理：

- 完整安装 TeX Live。
- 或用 `tlmgr` 安装相关包：

```powershell
tlmgr install biblatex-gb7714-2015
```

## 参考文献不显示

确认编译顺序：

```powershell
xelatex main.tex
biber main
xelatex main.tex
xelatex main.tex
```

或者直接：

```powershell
latexmk -xelatex main.tex
```

## 中文字体报错

如果模板指定了某个字体但系统没有安装，会报字体错误。可以先改成 Windows 常见字体：

```latex
\setCJKmainfont{SimSun}
\setCJKsansfont{SimHei}
\setCJKmonofont{FangSong}
```

## MiKTeX 和 TeX Live 混用

如果电脑同时安装了 MiKTeX 和 TeX Live，检查：

```powershell
where xelatex
where biber
where latexmk
```

第一条应来自同一个 TeX Live 目录。混用不同发行版的命令容易导致缺包或版本冲突。
