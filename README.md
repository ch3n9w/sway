# ch4xer's personal configuration

This repo aimed to backup my configuration, including configuration of sway, waybar, neovim, alacritty, zsh and ranger. Introductions are as follows.

![](./image/first.png)

## zsh
use powerlevel10k as theme, and set some useful alias.
installed plugins:
- autojump
- zsh-syntax-highlighting
- extract.plugin

## alacritty
theme: solarized dark
font: JetBrainsMono Nerd Font

## sway
notable customization:
- use both number area and the bottom line of the letter area keyboard for workspace operations to make fingers comfortable
- use nord theme for rofi

## ranger
notable customization:
- custom icons
- fzf search
- copy (or cut) and paste between different ranger instances

## waybar
including:
- cpu
- ram
- temprature
- network
- 7 workspace
- book search
- volumn
- battery status
- date
- clock

## neovim
```
.
├── init.lua                // main file
├── lua
│   ├── base
│   │   └── init.lua        // base configuration
│   ├── keymap
│   │   └── init.lua        // custom keymap
│   └── plugins
│       ├── edit
│       │   └── init.lua    // plugins for editing
│       ├── init.lua        // packer will import other other init.lua and load plugins
│       ├── interface
│       │   └── init.lua    // interface plugins, including topbar, bottom bar, indent line, etc
│       ├── lsp
│       │   └── init.lua    // lsp autocomplete plugins
│       ├── sideview
│       │   └── init.lua    // sideview plugins
│       └── theme
│           └── init.lua    // theme plugin
├── plugin
│   └── packer_compiled.lua // packer generated file

```
install:
- install packer.nvim
- open lua/plugins/init.lua, quote following lines:
```
edit_plugins.load()
interface_plugins.load()
sideview_plugins.load()
theme_plugins.load()
lsp_plugins.load()
```
and save
- move configuration folder to you $XDG_CONFIG_HOME
- open neovim and run PackerInstall
- unquote the lines above
- save and reopen
- finish

some screenshot:

call terminal in neovim
![](./image/2021-12-23-14-46-23.png)

fuzzy file search
![](./image/2021-12-23-14-45-36.png)

code completion
![](./image/2021-12-23-14-50-58.png)
