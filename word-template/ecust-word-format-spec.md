# Word Format Spec Extracted from LaTeX Template

本文件从 `paper/template/template.tex` 中提取可映射到 Word 的格式规则，用于后续生成或调整 Word 审阅模板。

> **注意：** 本文件基于内置默认模板（ECUST 硕士论文）提取。如果你使用其他学校的模板，请对 Codex 说"根据我的模板更新 Word 格式映射"，它会自动重新提取。

来源：

```text
paper/template/template.tex
```

注意：这是从 LaTeX 模板参数提取的 Word 映射规格，不等同于学校官方 Word 模板。最终格式仍需以学校、学院和导师最新要求为准。

## 页面设置

LaTeX：

```latex
\documentclass[UTF-8,a4paper,twoside]{article}
\geometry{left=2.5cm,right=2.5cm,top=2.8cm,bottom=2.0cm,headheight=2.0cm,footskip=1.2cm}
```

Word 映射：

| 项目 | 值 |
| --- | --- |
| 纸张 | A4 |
| 左边距 | 2.5 cm |
| 右边距 | 2.5 cm |
| 上边距 | 2.8 cm |
| 下边距 | 2.0 cm |
| 页眉高度/位置参考 | 2.0 cm |
| 页脚距离参考 | 1.2 cm |
| 双面排版 | LaTeX 使用 `twoside`，Word 可按奇偶页页眉设置 |

## 正文字体与段落

LaTeX：

```latex
\setCJKmainfont{SimSun.ttc}[AutoFakeBold=true, Path=./SimSun/, Extension = .ttc]
\usepackage{newtxtext}
\linespread{1.4375}
\setlength{\parskip}{0pt}
\setlength{\parindent}{2em}
```

Word 映射：

| 项目 | 值 |
| --- | --- |
| 中文正文 | 宋体 |
| 英文/数字 | Times New Roman |
| 正文字号 | 小四 |
| 行距 | 约 1.25 倍；LaTeX 用 `linespread=1.4375` 近似 |
| 段前/段后 | 0 |
| 首行缩进 | 2 字符 |

## 页眉页脚

LaTeX：

```latex
\fancyhead[LO,RE]{\kaishu\bfseries\zihao{4}{华东理工大学}\normalfont\songti\zihao{-4}{硕士学位论文}}
\fancyhead[RO,LE]{\zihao{-4}{第}\thepage{页}}
```

Word 映射：

| 区域 | 内容 | 样式 |
| --- | --- | --- |
| 左/偶页页眉 | [学校名称] + [学位类型] 论文 | 根据学校模板要求设置 |
| 右/奇页页眉 | 第 X 页 | 小四 |
| 前置页页码 | 罗马数字 | I, II, III... |
| 正文页页码 | 阿拉伯数字 | 1, 2, 3... |

## 目录

LaTeX：

```latex
\renewcommand{\contentsname}{\zihao{4}\bfseries{目录}}
\setlength{\cftsecindent}{0em}
\setlength{\cftsubsecindent}{0em}
\setlength{\cftsubsubsecindent}{0em}
\renewcommand{\cftdotsep}{0.5}
\renewcommand{\cftsecfont}{\zihao{4}}
\renewcommand{\cftsecpagefont}{\zihao{4}}
\renewcommand{\cftsubsecfont}{\zihao{-4}}
\renewcommand{\cftsubsubsecfont}{\zihao{-4}}
```

Word 映射：

| 项目 | 值 |
| --- | --- |
| 目录标题 | 目录，四号，加粗 |
| 目录级别 | 至少三级 |
| 一级目录 | 四号 |
| 二级目录 | 小四 |
| 三级目录 | 小四 |
| 引导线 | 点引导线 |

## 标题样式

LaTeX：

```latex
\ctexset{
  section={
    name={第,章},
    format=\heiti\zihao{4}\centering,
    beforeskip=3ex,
    afterskip=3ex
  },
  subsection={
    format=\bfseries\zihao{-4},
    beforeskip=0.6em,
    afterskip=0.6em
  },
  subsubsection={
    format=\zihao{-4},
    beforeskip=0ex,
    afterskip=0ex
  }
}
```

Word 映射：

| 样式 | 字体 | 字号 | 对齐 | 段前/段后 |
| --- | --- | --- | --- | --- |
| 一级标题/章标题 | 黑体 | 四号 | 居中 | 段前约 3ex，段后约 3ex |
| 二级标题 | 加粗 | 小四 | 左对齐 | 段前/段后约 0.6em |
| 三级标题 | 正常 | 小四 | 左对齐 | 段前/段后 0 |

章标题编号格式：

```text
第 1 章 绪论
```

## 摘要与关键词

LaTeX：

```latex
\begin{center}
  \heiti\zihao{4}论文题目
\end{center}
\begin{center}
  \zihao{4}\bfseries{摘要}
\end{center}
\zihao{-4}
\noindent\zihao{-4}{\bfseries 关键词：}
```

Word 映射：

| 项目 | 样式 |
| --- | --- |
| 中文题目 | 黑体，四号，居中 |
| 中文摘要标题 | 四号，加粗，居中 |
| 中文摘要正文 | 小四 |
| 关键词标签 | 小四，加粗 |
| 英文题目 | 四号，加粗，居中 |
| Abstract 标题 | 四号，加粗，居中 |
| 英文摘要正文 | 小四 |
| Keywords 标签 | 小四，加粗 |

## 列表

LaTeX：

```latex
\setlist[enumerate]{label=(\arabic*),fullwidth,itemindent=\parindent,listparindent=\parindent,itemsep=0ex,partopsep=0pt,parsep=0ex,nosep}
```

Word 映射：

| 项目 | 值 |
| --- | --- |
| 编号格式 | `(1)`, `(2)`, `(3)` |
| 段前/段后 | 0 |
| 列表间距 | 紧凑 |

## 图表与公式

LaTeX：

```latex
\numberwithin{equation}{section}
\numberwithin{table}{section}
\numberwithin{figure}{section}
\renewcommand{\theequation}{\thesection-\arabic{equation}}
\DeclareCaptionLabelSeparator{colon}{ \ \ }
\DeclareCaptionFont{chfont}{\bfseries\zihao{5}}
\DeclareCaptionFont{enfont}{\zihao{5}}
```

Word 映射：

| 项目 | 值 |
| --- | --- |
| 公式编号 | 按章编号，如 `(1-1)` 或 `1-1`，需按学院要求确认 |
| 表编号 | 按章编号 |
| 图编号 | 按章编号 |
| 中文图表题注 | 五号，加粗 |
| 英文图表题注 | 五号 |
| 图题位置 | LaTeX 示例为图下方 |
| 表题位置 | LaTeX 示例为表上方 |
| 中英文题注 | 使用 `bicaption`，支持双语题注 |

## 参考文献

LaTeX：

```latex
\usepackage[backend=biber,style=gb7714-2015,gbalign=left,gbnamefmt=lowercase]{biblatex}
\renewcommand{\bibfont}{\zihao{-4}}
\setlength{\bibitemsep}{0pt}
```

Word 映射：

| 项目 | 值 |
| --- | --- |
| 参考文献格式 | GB/T 7714-2015 |
| 字号 | 小四 |
| 条目间距 | 0 |
| 编号对齐 | 左对齐 |

## 可自动化程度

| 项目 | Word 自动化可行性 |
| --- | --- |
| 页面边距 | 高 |
| 正文字体/字号/行距 | 高 |
| 标题样式 | 高 |
| 页眉页脚 | 中 |
| 罗马页码与正文页码切换 | 中 |
| 自动目录 | 中 |
| 图表题注 | 中 |
| 参考文献 GB/T 7714 | 中，需要 Zotero/CSL 或后期人工检查 |
| 与 LaTeX PDF 逐页一致 | 低，不建议作为目标 |

## 建议定位

Word 版建议作为：

```text
导师批注稿 + 近似学校格式审阅稿
```

LaTeX/PDF 仍作为：

```text
正式排版稿
```
