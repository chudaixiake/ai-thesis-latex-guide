# 从 LaTeX 模板提取 Word 格式

本项目提供了一份从 `blanche07/ecust-master-thesis-latex` 模板参数提取出来的 Word 格式映射规格：

```text
word-template/ecust-word-format-spec.md
```

一键初始化出的论文项目也会包含：

```text
word/ecust-word-format-spec.md
```

## 这份规格解决什么问题

它把 LaTeX 模板里的格式参数整理成 Word 可理解的设置，例如：

- A4 纸张
- 页边距
- 页眉页脚
- 正文字体和字号
- 行距
- 标题样式
- 目录样式
- 图表题注样式
- 参考文献字号和 GB/T 7714 方向

## 它不解决什么问题

它不能保证：

```text
Word 和 LaTeX PDF 逐页完全一致
```

原因是 Word 和 LaTeX 的分页、浮动体、目录、题注和字体渲染机制不同。

## 推荐用法

把它作为 AI 创建或调整 Word 审阅模板的依据：

```text
请根据 word/ecust-word-format-spec.md，生成一个华理硕士论文 Word 审阅模板。
```

或：

```text
请根据 word/ecust-word-format-spec.md，检查 docs/export/review-draft.docx 的页面、标题、正文、页眉页脚和参考文献样式。
```

## 最佳协作方式

```text
LaTeX/PDF：正式排版稿
Word：按格式规格尽量接近的导师批注稿
AI：根据 Word 批注和格式规格，把修改同步回 LaTeX
```

如果老师只使用 Word，可以让 AI 基于这份规格维护 Word 审阅稿；但最终是否以 Word 提交，需要以学院要求为准。
