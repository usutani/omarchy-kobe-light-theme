# Kobe Light — Omarchy Theme

**基本方針:** すべての色値は VS Code 公式リポジトリのソースファイル (`light_modern.json`, `light_plus.json`, `light_vs.json`, `editorColors.ts` 等) から抽出する。デフォルト値から逸脱する場合は、その理由と参照元を明記する。「なんとなく赤」のような憶測で色を設定しない。

## ディレクトリ構造

```
~/.config/omarchy/themes/kobe-light/
├── backgrounds/          # 壁紙 (提供: 神戸市 PHOTO PORT)
├── btop.theme            # btop リソースモニター色
├── chromium.theme        # Chromium 新規タブ背景色 (RGB)
├── colors.toml           # ★ コアカラー定義 (Omarchy が各設定を生成)
├── colors/               # Neovim colorscheme本体 (kobe-light.lua)
├── hyprland.conf         # アクティブウィンドウ枠色
├── hyprlock.conf         # ロック画面色 (RGBA)
├── icons.theme           # ファイルマネージャアイコンセット
├── light.mode            # ライトテーマ認識用マーカー
├── mako.ini              # 通知デーモン色
├── neovim.lua            # Neovim colorscheme (lazy.nvim spec)
├── obsidian.css          # Obsidian テーマ
├── preview.png           # テーマ選択画面プレビュー画像
├── swayosd.css           # OSD 表示色
├── vscode.json           # VS Code テーマ参照
├── walker.css            # アプリランチャー色
├── waybar.css            # ステータスバー色
├── LICENSE               # MIT ライセンス
└── README.md             # テーマ説明
```

## カラーパレット (`colors.toml`)

| Key | Hex | 由来 |
|-----|-----|------|
| `background` | `#FFFFFF` | エディタ背景 |
| `foreground` | `#3B3B3B` | エディタ文字色 |
| `accent` | `#005FB8` | フォーカス枠/アクセント青 |
| `selection_background` | `#ADD6FF` | 選択背景色 |

全16色の ANSI ターミナルカラーも VS Code ライトテーマ準拠。

## 参照実装 (VS Code)

### Theme Inheritance Chain

```
light_modern.json  (ワークベンチUI色)
  └─ include → light_plus.json  (セマンティックトークン色)
       └─ include → light_vs.json  (シンタックスハイライト基底色)
```

### リポジトリ参照先

| ファイル | 内容 | URL |
|---------|------|-----|
| `light_modern.json` | ワークベンチUI色 (サイドバー、タブ、ステータスバー etc.) | [microsoft/vscode](https://github.com/microsoft/vscode/blob/main/extensions/theme-defaults/themes/light_modern.json) |
| `light_plus.json` | 追加シンタックス/セマンティック色 | [microsoft/vscode](https://github.com/microsoft/vscode/blob/main/extensions/theme-defaults/themes/light_plus.json) |
| `light_vs.json` | 基底シンタックス色 | [microsoft/vscode](https://github.com/microsoft/vscode/blob/main/extensions/theme-defaults/themes/light_vs.json) |

### カラーパレット詳細 (`colors.toml`)

| Key | Hex | VS Code Key | 定義ファイル |
|-----|-----|-------------|-------------|
| `background` | `#FFFFFF` | `editor.background` | `light_modern.json` |
| `foreground` | `#3B3B3B` | `editor.foreground` | `light_modern.json` |
| `accent` | `#005FB8` | `focusBorder` | `light_modern.json` |
| `selection_background` | `#ADD6FF` | `editor.selectionBackground` | (デフォルト) |
| `comment` | `#008000` | `comment` scope | `light_vs.json` |

ANSI ターミナルカラーは VS Code `terminalColorRegistry` のライトモードデフォルト値。

### VS Code → Neovim Highlight Group 対応表

#### シンタックスハイライト (TextMate scope → Treesitter HL)

| VS Code Scope | Treesitter HL | Hex |
|---|---|---|
| `comment` | `@comment` | `#008000` |
| `string` | `@string` | `#A31515` |
| `constant.numeric` | `@number` | `#098658` |
| `keyword` / `keyword.control` | `@keyword` | `#0000FF` |
| `keyword.control` (light_plus) | `@keyword.conditional` / `@keyword.repeat` / `@keyword.exception` | `#AF00DB` |
| `keyword.operator` | `@operator` | `#000000` |
| `entity.name.function` | `@function` | `#795E26` |
| `support.class` / `entity.name.type` | `@type` / `@type.builtin` | `#267F99` |
| `variable` | `@variable` | `#001080` |
| `variable.language` | `@variable.builtin` | `#0000FF` |
| `variable.other.constant` | `@constant` | `#0070C1` |
| `entity.name.tag` | `@tag` | `#800000` |
| `entity.other.attribute-name` | `@attribute` | `#E50000` |
| `markup.heading` | `@markup.heading` (+`.1-6`, `markdownH1-6`) | `#0451A5` ※ |
| `markup.bold` | `@markup.strong` (`markdownBold`) | `#000080` |
| `markup.italic` | `@markup.italic` (`markdownItalic`) | `#800080` |
| `markup.inline.raw` | `@markup.raw` (`markdownCode`) | `#800000` |
| `punctuation.definition.quote.begin.markdown` | `@markup.quote` (`markdownBlockquote`) | `#0451A5` |
| `punctuation.definition.list.begin.markdown` | `@markup.list` (`markdownListMarker`) | `#0451A5` |
| `textLink.foreground` | `@markup.link` / `.url` (`markdownLinkText`, `markdownUrl`) | `#005FB8` |
| `textCodeBlock.background` + `textPreformat.foreground` | `@markup.raw.block` (`markdownCodeBlock`) | bg `#F8F8F8` / fg `#3B3B3B` |
| `markup.inserted` | `@diff.plus` | `#098658` |
| `markup.deleted` | `@diff.minus` | `#A31515` |
| `markup.changed` | `@diff.change` | `#0451A5` |
| `constant.character.escape` | `@string.escape` | `#EE0000` |
| `punctuation.definition.tag` | `@punctuation.bracket` | `#800000` |
| `meta.preprocessor` | `@preproc` | `#0000FF` |
| `support.type.property-name` | `@property` | `#E50000` |
| `constant.other.color.rgb-value` | `@number` | `#0451A5` |
| `storage.modifier` | `@keyword.modifier` | `#0000FF` |

> ※ `markup.heading` は公式 `light_vs.json` (`#800000`) からの逸脱。実行環境の VS Code が Omarchy生成テーマ (Markdown Heading `#0451A5` bold) で動作しているため、エディタ表示の整合を優先して `#0451A5` を採用 (2026-10-03)。

#### VS Code ワークベンチUI → Neovim HL

| VS Code Color Key | Neovim HL | Hex |
|---|---|---|
| `editor.background` | `Normal` | `#FFFFFF` |
| `sideBar.background` | `NormalSB` / `NormalNC` | `#F8F8F8` |
| `list.hoverBackground` | `CursorLine` | `#F2F2F2` |
| `list.activeSelectionBackground` | `Visual` | `#E8E8E8` |
| `editor.selectionHighlightBackground` | `Visual` | `#ADD6FF` |
| `editor.inactiveSelectionBackground` | `VisualNOS` | `#E5EBF1` |
| `editorLineNumber.foreground` | `LineNr` | `#6E7681` |
| `editorLineNumber.activeForeground` | `CursorLineNr` | `#171184` |
| `editorIndentGuide.background1` | `IndentBlankline` | `#D3D3D3` |
| `focusBorder` | `FloatBorder` / `WinSeparator` | `#005FB8` |
| `inputOption.activeBackground` | `PmenuSel` | `#BED6ED` |
| `badge.background` | `PmenuThumb` / `PmenuSbar` | `#CCCCCC` |
| `errorForeground` | `DiagnosticError` | `#F85149` |
| `editorGutter.addedBackground` | `GitSignsAdd` / `DiffAdd` | `#2EA043` |
| `editorGutter.deletedBackground` | `GitSignsDelete` / `DiffDelete` | `#F85149` |
| `editorGutter.modifiedBackground` | `GitSignsChange` / `DiffChange` | `#005FB8` |
| `tab.activeBorderTop` | `TabLineSel` | `#005FB8` |
| `editor.findMatchBackground` | `CurSearch` / `IncSearch` | `#A8AC94` |
| `editor.findMatchHighlightBackground` | `Search` | `#F8C9AA` |
| `editor.findRangeHighlightBackground` | `Search` (範囲限定時) | `#b4b4b44d` |

#### LazyVim / lazy.nvim 専用グループ

| LazyVim HL | Link元 | VS Code 相当 | 推奨色 |
|---|---|---|---|
| `LazyH1` | `IncSearch` | `button.background` | bg=`#005FB8`, fg=`#FFFFFF` |
| `LazyH2` | `Bold` | `focusBorder` | fg=`#005FB8`, bold |
| `LazyButton` | `CursorLine` | `button.secondaryBackground` | bg=`#E5E5E5`, fg=`#3B3B3B` |
| `LazyButtonActive` | `Visual` | `button.background` | bg=`#005FB8`, fg=`#FFFFFF` |
| `LazySpecial` | `@punctuation.special` | `#AF00DB` | fg=`#BC05BC` |
| `LazyCommit` | `@variable.builtin` | `#0000FF` | fg=`#005FB8` |
| `LazyCommitType` | `Title` | `#949800` | fg=`#949800` |
| `LazyCommitScope` | `Italic` | `#A31515` | fg=`#CD3131`, italic |
| `LazyProgressDone` | `Constant` | `#005FB8` | fg=`#005FB8` |
| `LazyProgressTodo` | `LineNr` | `#D3D3D3` | fg=`#D3D3D3` |
| `LazyDimmed` | `Conceal` | `comment` | fg=`#008000` |
| `LazyProp` | `Conceal` | `#6E7681` | fg=`#6E7681` |
| `LazyValue` | `@string` | `#A31515` | fg=`#A31515` |
| `LazyError` | `DiagnosticError` | `#F85149` | fg=`#CD3131` |
| `LazyWarning` | `DiagnosticWarn` | `#949800` | fg=`#949800` |
| `LazyInfo` | `DiagnosticInfo` | `#005FB8` | fg=`#005FB8` |
| `SnacksDashboardHeader` | `Title` | `#005FB8` | fg=`#005FB8`, bold |
| `SnacksDashboardIcon` | `Special` | `#005FB8` | fg=`#005FB8` |
| `SnacksDashboardKey` | `Number` | `#005FB8` | fg=`#005FB8`, bold |
| `SnacksDashboardDesc` | `Special` | `#3B3B3B` | fg=`#3B3B3B` |
| `SnacksDashboardFooter` | `Title` | `#005FB8` | fg=`#005FB8` |

## 適用

```bash
omarchy theme set kobe-light
```

Neovim colorscheme は standalone 実装。


