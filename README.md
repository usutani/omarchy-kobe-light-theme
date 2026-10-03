# Kobe Light — Omarchy Theme

A custom theme for Omarchy.

![Preview](preview.png)


## Usage

Install and apply:

```bash
omarchy theme install https://github.com/usutani/omarchy-kobe-light-theme.git
```

The install command clones the theme and applies it automatically.
To switch back to it later:

```bash
omarchy theme set kobe-light
```

## Neovim

Omarchy does not stage top-level `.lua` files from git-installed themes,
so `install` / `set` alone runs Neovim with the generated aether-based spec —
not this theme's standalone colorscheme (`colors/kobe-light.lua`).

To use the standalone colorscheme, point LazyVim at this theme's spec:

```bash
ln -sfn ~/.config/omarchy/themes/kobe-light/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
```

Then restart Neovim. This symlink survives `theme set` re-runs; when switching
to another theme, restore it to `~/.local/state/omarchy/current/theme/neovim.lua`.

## Components

- **colors.toml** — canonical core palette (VS Code Light+ derived); Omarchy generates Hyprland, Waybar, Mako, Walker, SwayOSD, Hyprlock and VS Code colors from it
- **Neovim** — standalone colorscheme (`colors/kobe-light.lua`) with a LazyVim spec (`neovim.lua`)
- **Terminals** — hand-written configs: Alacritty, Foot, Kitty, Ghostty
- **Obsidian** — note app theme
- **btop** — resource monitor colors
- **Chromium** — new tab background color
- **Icons** — file manager icon set (`icons.theme`)
- **Wallpaper** — bundled (`backgrounds/`)
  - `suma-coast.jpg` — Suma Coast (provided by Kobe City / CC BY-NC-SA 4.0, [PHOTO PORT](https://www.photoport-kobe.jp/photo/836))

## License

MIT for code and configs — see [LICENSE](LICENSE) and [AGENTS.md](AGENTS.md) for details.
The bundled wallpaper is excluded from the MIT License: CC BY-NC-SA 4.0 (C) Kobe City,
see [backgrounds/LICENSE](backgrounds/LICENSE).
