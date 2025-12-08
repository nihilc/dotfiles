## Requirements

- [fd](https://github.com/sharkdp/fd)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [wl-clipboard](https://github.com/bugaevc/wl-clipboard)
- [zip](https://archlinux.org/packages/?name=zip)

## Plugins

- [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) ColorScheme
- [lspconfig](https://github.com/neovim/nvim-lspconfig/blob/master/lsp/html.lua) Quickstart configs for Nvim LSP.
    - [lazydev](https://github.com/folke/lazydev.nvim) Faster LuaLS setup for Neovim
    - [mason](https://github.com/mason-org/mason.nvim) Easily install and manage LSP servers, DAP servers, linters, and formatters.
    - [mason-lspconfig](https://github.com/mason-org/mason-lspconfig.nvim) Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.
    - [conform](https://github.com/stevearc/conform.nvim) Lightweight yet powerful formatter plugin for Neovim.
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) A completion engine plugin for neovim written in Lua
    - [luasnip](https://github.com/L3MON4D3/LuaSnip) Snippet Engine for Neovim written in Lua.
    - [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) Set of preconfigured snippets for different languages.
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) Nvim Treesitter configurations and abstraction layer
- [neogit](https://github.com/NeogitOrg/neogit) An interactive and powerful Git interface
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim) Git integration for buffers
- [mini.nvim](https://github.com/nvim-mini/mini.nvim) Library of 40+ independent Lua modules improving overall Neovim
    - [mini.pick](https://nvim-mini.org/mini.nvim/readmes/mini-pick) Pick anything
    - [mini.files](https://nvim-mini.org/mini.nvim/readmes/mini-files) Navigate and manipulate file system
    - [mini.sessions](https://nvim-mini.org/mini.nvim/readmes/mini-sessions) Session management
    - [mini.extra](https://nvim-mini.org/mini.nvim/readmes/mini-extra) Extra ‘mini.nvim’ functionality
    - [mini.starter](https://nvim-mini.org/mini.nvim/readmes/mini-starter) Start screen
    - [mini.icons](https://nvim-mini.org/mini.nvim/readmes/mini-icons) Icon provider
    - [mini.indentscope](https://nvim-mini.org/mini.nvim/readmes/mini-indentscope) Visualize and work with indent scope
- [lualine](https://github.com/nvim-lualine/lualine.nvim) A blazing fast and easy to configure Neovim statusline written in Lua.
- [which-key](https://github.com/folke/which-key.nvim) WhichKey helps you remember your Neovim keymaps
- [nvim-colorizer](https://github.com/catgoose/nvim-colorizer.lua) The fastest Neovim colorizer

## Keymaps

### Basic

- General
| mode     | keymap       | description            |
|----------|--------------|------------------------|
| `n`, `i` | `<c-s>`      | Save File              |
| `t`      | `<esc><esc>` | Exit terminal mode     |
| `n`      | `<esc>`      | Clear search highlight |
- Navigation
| mode     | keymap  | description                         | note               |
|----------|---------|-------------------------------------|--------------------|
| `n`      | `j`     | Move down                           | remap to `gj`      |
| `n`      | `k`     | Move up                             | remap to `gk`      |
| `c`,`i`  | `<c-h>` | Move left                           |                    |
| `c`,`i`  | `<c-l>` | Move right                          |                    |
| `c`,`i`  | `<c-j>` | Move down                           |                    |
| `c`,`i`  | `<c-k>` | Move up                             |                    |
| `n`      | `<c-h>` | Move focus to the left window       |                    |
| `n`      | `<c-l>` | Move focus to the right window      |                    |
| `n`      | `<c-j>` | Move focus to the lower window      |                    |
| `n`      | `<c-k>` | Move focus to the upper window      |                    |
| `n`      | `<c-d>` | keep screen centered when `<c-d>`   | remap to `<c-d>zz` |
| `n`      | `<c-u>` | keep screen centered when `<c-u>`   | remap to `<c-u>zz` |
| `n`      | `n`     | keep screen centered when jump next | remap to `nzzzv`   |
| `n`      | `N`     | keep screen centered when jump prev | remap to `Nzzzv`   |
- Edition
| mode | keymap | description              |
|------|--------|--------------------------|
| `v`  | `J`    | Move selected lines down |
| `v`  | `K`    | Move selected lines up   |
- UI
| mode | keymap       | description    |
|------|--------------|----------------|
| `n`  | `<leader>uw` | UI Toggle wrap |
| `n`  | `<leader>ul` | UI Toggle list |

### Plugins

- [lspconfig](https://github.com/neovim/nvim-lspconfig/blob/master/lsp/html.lua) (on attach buffer), [conform](https://github.com/stevearc/conform.nvim)
| mode | keymaps      | description                   |
|------|--------------|-------------------------------|
| `n`  | `]d`         | Next Diagnostic               |
| `n`  | `[d`         | Prev Diagnostic               |
| `n`  | `K`          | Hover Symbol                  |
| `n`  | `gd`         | Go Definition                 |
| `n`  | `gD`         | Go Declaration                |
| `n`  | `gr`         | Go References (quickfix)      |
| `n`  | `gR`         | Go References (mini.pick)     |
| `n`  | `gi`         | Go Implementation (quickfix)  |
| `n`  | `gI`         | Go Implementation (mini.pick) |
| `n`  | `<leader>lr` | Lsp Rename                    |
| `n`  | `<leader>la` | Lsp Code Action               |
| `n`  | `<leader>ld` | Lsp Diagnostics               |
| `n`  | `<leader>lf` | Lsp/Conform Format            |
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
| mode | keymap      | description           |
|------|-------------|-----------------------|
| `i`  | `<c-y>`     | cmp confirm           |
| `i`  | `<c-e>`     | cmp abort             |
| `i`  | `<c-space>` | cmp complete          |
| `i`  | `<tab>`     | cmp luasnip jump next |
| `i`  | `<s-tab>`   | cmp luasnip jump prev |
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
| mode | keymap      | description                       |
|------|-------------|-----------------------------------|
| `n`  | `<c-space>` | TSIncremental Selection Start     |
| `n`  | `<c-j>`     | TSIncremental Selection increment |
| `n`  | `<c-k>`     | TSIncremental Selection decrement |
- [neogit](https://github.com/NeogitOrg/neogit), [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
| mode     | keymap       | description               |
|----------|--------------|---------------------------|
| `n`      | `<leader>gg` | Git Status                |
| `n`      | `]c`         | Next Git Hunk             |
| `n`      | `[c`         | Prev Git Hunk             |
| `n`,`v`  | `<leader>gs` | Git Stage Hunk            |
| `n`,`v`  | `<leader>gr` | Git Reset Hunk            |
| `n`,     | `<leader>gS` | Git Stage Buffer          |
| `n`,     | `<leader>gR` | Git Reset Buffer          |
| `n`,     | `<leader>gv` | Git Preview Hunk          |
| `n`,     | `<leader>gV` | Git Preview Hunk (inline) |
- [mini.pick](https://nvim-mini.org/mini.nvim/readmes/mini-pick)
| mode | keymap       | description    |
|------|--------------|----------------|
| `n`  | `<leader>ff` | Find Files     |
| `n`  | `<leader>fb` | Find Buffers   |
| `n`  | `<leader>fg` | Find Grep Live |
| `n`  | `<leader>fw` | Find Word      |
| `n`  | `<leader>fW` | Find WORD      |
| `n`  | `<leader>ht` | Help Tags      |
| `n`  | `<leader>hk` | Help Keymaps   |
- [mini.files](https://nvim-mini.org/mini.nvim/readmes/mini-files)
| mode                | keymap       | description                           | note                                                                                                              |
|---------------------|--------------|---------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| `n`                 | `<leader>e`  | Open mini.files (current file or cwd) |                                                                                                                   |
| `n`                 | `<leader>E`  | Open mini.files (cwd)                 |                                                                                                                   |
| `n` (in mini.files) | `gx`         | Open in OS                            |                                                                                                                   |
| `n` (in mini.files) | `<leader>yy` | Copy to Clipboard                     | requires [wl-clipboard](https://github.com/bugaevc/wl-clipboard)                                                  |
| `n` (in mini.files) | `<leader>yp` | Copy Path to Clipboard                | requires [wl-clipboard](https://github.com/bugawvc/wl-clipboard)                                                  |
| `n` (in mini.files) | `<leader>yz` | Zip and Copy to Clipboard             | requires [wl-clipboard](https://github.com/bugawvc/wl-clipboard), [zip](https://archlinux.org/packages/?name=zip) |
- [mini.sessions](https://nvim-mini.org/mini.nvim/readmes/mini-sessions)
| mode | keymap       | description    |
|------|--------------|----------------|
| `n`  | `<leader>sn` | Session New    |
| `n`  | `<leader>sr` | Session Read   |
| `n`  | `<leader>sd` | Session Delete |
- Others
| mode | keymap      | description               | plugin    |
|------|-------------|---------------------------|-----------|
| `n`  | `<leader>?` | Show Buffer Local Keymaps | which-key |
| `n`  | `<leader>uc` | UI Toggle Colorizer | nvim-colorizer |
