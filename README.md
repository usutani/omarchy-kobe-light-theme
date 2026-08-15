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

MIT — see [LICENSE](LICENSE) and [AGENTS.md](AGENTS.md) for details.
