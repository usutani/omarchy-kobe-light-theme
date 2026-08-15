# kobe-light の Omarchy Quattro 対応 移行計画

作成日: 2026-08-15
更新日: 2026-08-15 (実機 resolver 検証に基づく事実誤認の修正と項目追加)
対象環境: Omarchy 4.0.0-1 (Quattro) / Hyprland (Lua 設定) / Quickshell

## 1. 目的

kobe-light テーマを Omarchy 4 (Quattro) で「意図どおりに」動作させる。

現状は Quattro のレガシー互換レイヤーを経由して動作しており、見た目は概ね再現されているが、以下が未対応のままである:

1. `colors.toml` が旧スキーマ (ANSI `color0`–`color15` + 基本キー) で、Quattro の canonical キー (`mode`, `selection`, `muted`, `dark_background`, 等) を定義していない。
2. 未定義キーの一部が**自動計算**され、ライトテーマとして不自然な色になる箇所がある。
3. Quattro で廃止されたコンポーネント向けのファイルが残留し、誤解を招く。
4. カーソル色が resolver により想定外の値に置き換えられる。

本計画では AGENTS.md の基本方針を維持する: **すべての色値は VS Code 公式リポジトリのソースファイルから抽出し、逸脱する場合は理由と参照元を明記する。**

## 2. 現状分析

### 2.1 環境

- Omarchy `4.0.0-1` (Quattro)。**現時点の適用テーマは `tokyo-night`** であり、kobe-light は未適用 (`~/.local/state/omarchy/current/theme.name` = `tokyo-night` を実測確認)。移行は**先に `omarchy theme set kobe-light` で再適用**してから進める。検証も再適用後の `~/.local/state/omarchy/current/theme/` に対して行う。
- **リポジトリとインストール先の関係:** `omarchy theme set` は `~/.config/omarchy/themes/kobe-light/` を読むが、これは本リポジトリ (`/home/usutani/Work/.../omarchy-kobe-light-theme`) の**別コピー** (symlink ではなく独自 `.git` を持つ) で、リポジトリの編集は自動では反映されない。検証前に `rsync -a --exclude .git <repo>/ ~/.config/omarchy/themes/kobe-light/` で同期するか、`rm -rf` してリポジトリへの symlink に置き換える。既存インストールの削除は必須ではないが、同期/置換は必要。
- Quickshell 稼働中。waybar / mako / swayosd / hyprlock / hypridle は**未インストール** (実測: `command -v` で確認)、walker はバイナリのみ残存 (`/usr/bin/walker`) するが Quickshell には使われず**未使用**。
- テーマ適用時に `default/themed/*.tpl` から各種ファイルが生成され、`shell.toml` / `hyprland.lua` が反映される。生成は `if [[ ! -f $output_path ]]` で**テーマ側に同名ファイルがあればスキップ**されるため、手書きファイルが優先される。

### 2.2 Quattro のレガシー互換の仕組み

本計画で「canonical」とは、Quattro が resolver とテンプレートで**標準として解釈する semantic キー群** (`mode`, `accent`, `selection`, `muted`, `background` / `dark_background` / `darker_background` / `lighter_background`, `foreground` / `dark_foreground` / `light_foreground` / `bright_foreground`, `red`–`cyan` / `orange` / `brown`, `bright_*`) を指す。旧スキーマの短縮キー (`color0`–`color15` 等) はレガシー扱いで、以下に示す解決カスケードにより canonical へ自動マッピングされる:

| canonical | 解決元 (未定義時) |
|-----------|-------------------|
| `red` / `bright_red` | `color1` / `color9` |
| `green` / `bright_green` | `color2` / `color10` |
| `yellow` / `bright_yellow` | `color3` / `color11` |
| `blue` / `bright_blue` | `color4` / `color12` |
| `magenta` / `bright_magenta` | `color5` / `color13` |
| `cyan` / `bright_cyan` | `color6` / `color14` |
| `light_foreground` / `bright_foreground` | `color7` / `color15` |
| `muted` / `dark_foreground` | `color8` |
| `selection` | `selection_background` |
| `lighter_background` | `color0` |
| `dark_background` / `darker_background` | **自動計算** (mix) |
| `orange` | `yellow` |
| `brown` | **自動計算** (mix) |

> `color0` / `color7` は `background` / `foreground` が定義済みの場合は先に上書きされるため、上表のフォールバックは実際には発動しない (⇒ 2.3 #5)。

### 2.3 判明した問題点

| # | 問題 | 影響 | 根拠 |
|---|------|------|------|
| 1 | `cursor` キーが resolver に上書きされ `bright_foreground` (#A5A5A5) になる | 端末/エディタカーソルが VS Code の `#000000` にならない | `omarchy-theme-color`: `THEME_COLORS[cursor]="${THEME_COLORS[bright_foreground]}"` |
| 2 | `dark_background` が自動計算で `#BFBFBF` になる | ライトテーマの「一段暗い背景」として不自然 | mix(`background`=#FFFFFF, 黒, 25%) |
| 3 | `darker_background` が自動計算で `#808080` になる | 同左 (さらに暗い) | mix(`background`, 黒, 50%) |
| 4 | `brown` が自動計算で `#4A4C00` (暗いオリーブ) になる | btop / nvim 生成物の `brown` が想定外 | mix(`yellow`=#949800, 黒, 50%) |
| 5 | `color0` (#DAD8CE) / `color7` (#555555) が resolver に `background` / `foreground` で上書きされる | 元の端末「黒 / 白」値は**現行レンダリングで既に失われている** (`color0`→#FFFFFF, `color7`→#3B3B3B) | background/foreground 定義時は color0/color7 を無条件上書き |
| 6 | `mode` キー未定義 (`light.mode` で代替) | 動作はするが canonical でない | 解決順: `mode` → `theme_type` → `light.mode` → 輝度自動判定 |
| 7 | `waybar.css` / `walker.css` / `mako.ini` / `swayosd.css` / `hyprlock.conf` / `hyprland.conf` / `vscode.json` が Quattro で実効なし | 死にファイル。メンテ対象として誤解を招く | Quattro でこれらコンポーネントは廃止 (vscode.json は記述子として読まれるが `extension` 空で実効なし) |

> **検証による注記 (2026-08-15):** 初版では「`lighter_background` = `color0` = `#DAD8CE` (黄みグレー)」を問題としたが、実機 `omarchy-theme-color --file ... --all` の結果、`color0` は `background` で上書きされるため **`lighter_background` は `#FFFFFF` に解決される**。同様に `light_foreground` は `#3B3B3B` (color7=#555555 ではない)。このため「黄みグレーが残る」問題は存在しない。

## 3. 方針

1. `colors.toml` を Quattro canonical スキーマへ移行する。既存色値は 1:1 で保持し、未定義だった派生キーは VS Code 由来の値を明示する。
2. `mode = "light"` を明示し、`light.mode` は残して両対応する。
3. 死にファイルを削除する。テンプレート生成対象が残るファイルは意図を明記して維持する。
4. テーマ再適用後の生成物 (`shell.toml` 等) を検証する。
5. カーソル色・端末背景など、下記の「未決定事項」は実装時に判断する。

## 4. 移行ステップ

### Step 0: バックアップ

- 現在の状態を git で確認し、必要なら作業ブランチを切る。
- 万が一の復元用に `omarchy refresh config omarchy/themes/kobe-light` 相当の退避ではなく、テーマディレクトリごとコピーして退避する。
- **インストール先をリポジトリに同期する** (§2.1 参照): `rsync -a --exclude .git <repo>/ ~/.config/omarchy/themes/kobe-light/` を実行してから適用・検証する。リポジトリを正とし、インストール先は削除して symlink に置き換えてもよい。

### Step 1: `colors.toml` を canonical スキーマへ移行

現在値 → canonical 対応表 (全色 VS Code 由来):

| canonical キー | 新値 | 由来 (現在値) | VS Code 参照 |
|---------------|------|---------------|--------------|
| `mode` | `"light"` | `light.mode` マーカー | — |
| `accent` | `#005FB8` | `accent` | `focusBorder` (`light_modern.json`) |
| `selection` | `#ADD6FF` | `selection_background` | `editor.selectionBackground` |
| `muted` | `#666666` | `color8` | terminal bright black |
| `background` | `#FFFFFF` | `background` | `editor.background` |
| `dark_background` | `#F8F8F8` | (未定義→自動計算) | `sideBar.background` (`light_modern.json`) |
| `darker_background` | `#F2F2F2` | (未定義→自動計算) | `list.hoverBackground` (`light_modern.json`) |
| `lighter_background` | `#FFFFFF` | 現行解決値 = `#FFFFFF` (color0 は background で上書き済み) | `editor.background` (ライトテーマは最明) |
| `foreground` | `#3B3B3B` | `foreground` | `editor.foreground` |
| `dark_foreground` | `#6E7681` | (未定義→`color8`=#666666) | `editorLineNumber.foreground` |
| `light_foreground` | `#555555` | 現行解決値 = `#3B3B3B`。旧 color7 の意図値 #555555 を復元 | terminal white |
| `bright_foreground` | `#A5A5A5` | `color15` | terminal bright white |
| `red` / `bright_red` | `#CD3131` | `color1` / `color9` | terminal red |
| `green` / `bright_green` | `#107C10` / `#14CE14` | `color2` / `color10` | terminal green |
| `yellow` / `bright_yellow` | `#949800` / `#B5BA00` | `color3` / `color11` | terminal yellow |
| `blue` / `bright_blue` | `#0451A5` | `color4` / `color12` | terminal blue |
| `magenta` / `bright_magenta` | `#BC05BC` | `color5` / `color13` | terminal magenta |
| `cyan` / `bright_cyan` | `#0598BC` | `color6` / `color14` | terminal cyan |
| `orange` | `#949800` | (= `yellow`) | VS Code に orange なし→yellow に揃える |
| `brown` | (未定義) | (自動計算 #4A4C00 を許容) | VS Code に brown なし。yellow 由来の自動計算値を採用 (2026-08-15 決定) |
| `selection_background` | `#ADD6FF` | `selection_background` | `editor.selectionBackground` |
| `selection_foreground` | `#FFFFFF` | `selection_foreground` | — |
| `comment` | `#008000` | `comment` | `comment` scope (`light_vs.json`) ※canonical に無いが手書き colorscheme 用に保持 |

補足:

- `comment` は Quattro テンプレートで使われず、手書き colorscheme (`colors/kobe-light.lua`) も `#008000` をハードコードしているため、colors.toml の `comment` を読む生成物は存在しない。保持するのは AGENTS.md のパレット表記との整合のため (削除しても実害なし)。
- `cursor` は Quattro に独立キーが無く、resolver が `bright_foreground` へ無条件上書きするため**定義しても反映されない** (⇒ 5. 未決定事項)。
- 旧 `color0`–`color15` は削除し、テンプレート生成物で必要なら上表の canonical 値から解決させる。端末の ANSI は背景=`background`・白=`foreground`・明るい黒=`muted`・明るい白=`bright_foreground` に解決され、現行レンダリング (resolver 適用後) と同一になる。

### Step 2: `mode` キーの追加

- `colors.toml` 先頭に `mode = "light"` を追加。
- 従来の `light.mode` マーカーも削除せず維持する (解決順の保険)。

### Step 3: 死にファイルの削除

削除するファイル (Quattro でコンポーネント廃止 or レガシー設定):

- `waybar.css` — Waybar 廃止 (Quickshell bar)
- `walker.css` — Walker 廃止 (Quickshell launcher/menu)
- `mako.ini` — Mako 廃止 (Quickshell notifications)
- `swayosd.css` — SwayOSD 廃止 (Quickshell OSD)
- `hyprlock.conf` — hyprlock 廃止 (Quickshell lock screen)
- `hyprland.conf` — レガシー (Quattro は `hyprland.lua` をテンプレート生成)
- `vscode.json` — 削除。`omarchy-theme-set-vscode` は今も記述子として読むが、`extension` が空のため実効影響は無く、生成 `vscode-theme.json` が "Omarchy" 名でインストールされる。将来 3rd-party 拡張 (`publisher.name`) を使うなら残す選択肢もある

残すファイル (Quattro でも有効):

- `chromium.theme` — `chromium.theme.tpl` が存在し、`background_rgb` 生成を手書きで上書き (`255,255,255`)。
- `icons.theme`, `backgrounds/`, `preview.png` — そのまま有効。
- `neovim.lua` — 手書き (自前 colorscheme 参照) で生成版を上書き。
- `btop.theme` — 手書きで生成版を上書き。
- `obsidian.css` — 手書きで生成版を上書き。
- `alacritty.toml` / `foot.ini` / `kitty.conf` / `ghostty.conf` — **手書き追加 (2026-08-15 決定)**。各端末は `~/.local/state/omarchy/current/theme/` の同名ファイルを import する。canonical 色を直書きし、カーソルのみ VS Code `#000000` に固定 (resolver は `bright_foreground`=#A5A5A5 に強制するため colors.toml では表現不可)。

新規追加 (任意):

- `unlock.png` — **Plymouth ブートロゴ**用 (`omarchy plymouth set-by-theme kobe-light` で適用)。ストックテーマは全て保有。Quickshell のロック画面 (背景画像) には使われない点に注意。テーマセット時には自動適用されないため任意。
- `preview-unlock.png` — Plymouth スイッチャー (`omarchy plymouth switcher`) のプレビューサムネイル。

### Step 4: 生成物との整合チェック

再適用 (`omarchy theme set kobe-light`) 後に確認する生成ファイル:

- 適用状態: `omarchy theme current` → `kobe-light`、`~/.local/state/omarchy/current/theme.name` が `kobe-light` であること。
- canonical 解決: `omarchy-theme-color --file ~/.config/omarchy/themes/kobe-light/colors.toml --all` で `mode=light`, `dark_background=#F8F8F8`, `darker_background=#F2F2F2`, `brown` (決定値), `cursor=bright_foreground` が解決されること。
- `shell.toml` — `[bar]`, `[popups]`, `[notifications]`, `[launcher]`, `[menu]`, `[polkit]`, `[lock]`, `[image-picker]` の配色が意図どおりか。
- `alacritty.toml` / `foot.ini` / `kitty.conf` / `ghostty.conf` — ANSI 色とカーソル色 (`cursor = bright_foreground`)。
- `vscode-theme.json` / `claude.json` / `pi.json` — canonical 色から自動生成される版。
- `hyprland.lua` — `active_border = accent` (#005FB8) を確認。
- `btop.theme` / `neovim.lua` / `obsidian.css` — 手書きファイルが生成版を上書きしていること。

### Step 5: シェル (Quickshell) 配色の精査

`shell.toml` の各 surface を VS Code ワークベンチ色に対応付けて目視確認する。特にライトテーマは `scrim-alpha` (メニュー背後) と `[lock]` の `border-active` が暗くならないことを確認する。

### Step 6: 検証

```bash
omarchy theme set kobe-light    # 再適用
omarchy debug --no-sudo --print # エラー確認
omarchy theme bg next           # 壁紙適用確認
```

- Neovim / btop / Obsidian / VS Code / 端末で配色を目視確認。
- Quickshell の bar・通知・ロック・メニュー・polkit を確認。

## 5. 未決定事項 (実装時に判断) — 決定済み (2026-08-15)

| # | 事項 | 決定 |
|---|------|------|
| 1 | カーソル色 | **(B) 手書き端末設定で #000000**。`alacritty.toml` / `foot.ini` / `kitty.conf` / `ghostty.conf` をテーマ内に手書き追加し、カーソルを VS Code `#000000` に固定。`bright_foreground` は #A5A5A5 維持 |
| 2 | `brown` | **自動計算 (#4A4C00) を許容**。`brown` キーは定義しない |
| 3 | `dark_background` / `darker_background` | **`#F8F8F8` / `#F2F2F2` で確定** (VS Code `sideBar.background` / `list.hoverBackground`) |
| 4 | 端末背景 | **`#FFFFFF` のまま**。手書き端末設定でも背景は変更しない (カーソルのみ #000000) |

## 6. 参考資料

- Quattro theming 仕様: `https://github.com/basecamp/omarchy/blob/quattro/docs/theming.md`
- レガシー解決カスケード: `/usr/bin/omarchy-theme-color`
- テンプレート一覧: `/usr/share/omarchy/default/themed/*.tpl`
- VS Code 参照元 (AGENTS.md 準拠):
  - `light_modern.json` — https://github.com/microsoft/vscode/blob/main/extensions/theme-defaults/themes/light_modern.json
  - `light_plus.json` — https://github.com/microsoft/vscode/blob/main/extensions/theme-defaults/themes/light_plus.json
  - `light_vs.json` — https://github.com/microsoft/vscode/blob/main/extensions/theme-defaults/themes/light_vs.json