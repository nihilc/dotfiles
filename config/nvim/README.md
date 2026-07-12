## Requirements

- [fd](https://github.com/sharkdp/fd)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [wl-clipboard](https://github.com/bugaevc/wl-clipboard)
- [zip](https://archlinux.org/packages/?name=zip)

## Plugins

- [Vague](https://github.com/vague-theme/vague.nvim) ColorScheme
- [lspconfig](https://github.com/neovim/nvim-lspconfig/blob/master/lsp/html.lua) Quickstart configs for Nvim LSP.
  - [mason](https://github.com/mason-org/mason.nvim) Easily install and manage LSP servers, DAP servers, linters, and formatters.
  - [blink.cmp](https://github.com/saghen/blink.cmp) Performant, batteries-included completion plugin for Neovim
  - [lazydev](https://github.com/folke/lazydev.nvim) Faster LuaLS setup for Neovim
  - [conform](https://github.com/stevearc/conform.nvim) Lightweight yet powerful formatter plugin for Neovim.
- [typst-preview.nvim](https://github.com/chomosuke/typst-preview.nvim) Low latency typst preview for Neovim
- [neogit](https://github.com/NeogitOrg/neogit) An interactive and powerful Git interface for Neovim
- [tree-sitter-manager.nvim](https://github.com/romus204/tree-sitter-manager.nvim) A lightweight Tree-sitter parser manager for Neovim
- [mini.nvim](https://github.com/nvim-mini/mini.nvim) Library of 40+ independent Lua modules improving overall Neovim
  - [mini.diff](https://nvim-mini.org/mini.nvim/readmes/mini-diff) Work with diff hunks
  - [mini.pairs](https://nvim-mini.org/mini.nvim/readmes/mini-pairs) Minimal and fast autopairs
  - [mini.surround](https://nvim-mini.org/mini.nvim/readmes/mini-surround) Surround actions
  - [mini.files](https://nvim-mini.org/mini.nvim/readmes/mini-files) Navigate and manipulate file system
  - [mini.pick](https://nvim-mini.org/mini.nvim/readmes/mini-pick) Pick anything
  - [mini.extra](https://nvim-mini.org/mini.nvim/readmes/mini-extra) Extra ‘mini.nvim’ functionality
  - [mini.sessions](https://nvim-mini.org/mini.nvim/readmes/mini-sessions) Session management
  - [mini.starter](https://nvim-mini.org/mini.nvim/readmes/mini-starter) Start screen
  - [mini.icons](https://nvim-mini.org/mini.nvim/readmes/mini-icons) Icon provider
  - [mini.notify](https://nvim-mini.org/mini.nvim/readmes/mini-notify) Show notifications
- [flash.nvim](https://github.com/folke/flash.nvim) Navigate your code with search labels, enhanced character motions and Treesitter integration
- [which-key.nvim](https://github.com/folke/which-key.nvim) WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type
- [nvim-colorizer](https://github.com/catgoose/nvim-colorizer.lua) The fastest Neovim colorizer
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) A blazing fast and easy to configure neovim statusline

## Keymaps

### Basic

- General
  | mode | keymap       | description            |
  | ---- | ------------ | ---------------------- |
  | `n`  | `<c-s>`      | Save File              |
  | `n`  | `<esc>`      | Clear search highlight |
  | `t`  | `<esc><esc>` | Exit terminal mode     |
- Navigation
  | mode | keymap  | description                         | note               |
  | ---- | ------- | ----------------------------------- | ------------------ |
  | `n`  | `<c-d>` | keep screen centered when `<c-d>`   | remap to `<c-d>zz` |
  | `n`  | `<c-u>` | keep screen centered when `<c-u>`   | remap to `<c-u>zz` |
  | `n`  | `n`     | keep screen centered when jump next | remap to `nzzzv`   |
  | `n`  | `N`     | keep screen centered when jump prev | remap to `Nzzzv`   |
- Edition
  | mode | keymap | description                                     | note                        |
  | ---- | ------ | ----------------------------------------------- | --------------------------- |
  | `x`  | `p`    | Paste over selection without losing yanked text | remap to `P`                |
  | `v`  | `J`    | Move selected lines down                        | remap to `:m '>+1<cr>gv=gv` |
  | `v`  | `K`    | Move selected lines up                          | remap to `:m '<-2<cr>gv=gv` |
  | `v`  | `<`    | Unindent and keep selection                     | remap to `<gv`              |
  | `v`  | `>`    | Indent and keep selection                       | remap to `>gv`              |
- UI
  | mode | keymap       | description    |
  | ---- | ------------ | -------------- |
  | `x`  | `<leader>uw` | UI toggle Wrap |
  | `x`  | `<leader>ul` | UI toggle List |

### Plugins

- lsp, [conform](https://github.com/stevearc/conform.nvim)
  | mode | keymap      | desciption                     |
  | ---- | ----------- | ------------------------------ |
  | `n`  | `grn`       | Lsp Rename                     |
  | `n`  | `gra`       | Lsp Code Action                |
  | `n`  | `grr`       | Lsp References                 |
  | `n`  | `grR`       | Lsp References (mini.pick)     |
  | `n`  | `gri`       | Lsp Implementation             |
  | `n`  | `grI`       | Lsp Implementation (mini.pick) |
  | `n`  | `<leader>F` | Format Conform/Lsp             |
- [typst-preview.nvim](https://github.com/chomosuke/typst-preview.nvim), lsp tinymist
  | mode | keymap       | desciption          |
  | ---- | ------------ | ------------------- |
  | `n`  | `<leader>tp` | Typst Preview       |
  | `n`  | `<leader>ts` | Typst Preview Sync  |
  | `n`  | `<leader>tm` | Tinymist Pin Main   |
  | `n`  | `<leader>te` | Tinymist Export PDF |
- [blink.cmp](https://github.com/saghen/blink.cmp) (default)
  | mode | keymap          | desciption                           |
  | ---- | --------------- | ------------------------------------ |
  | `i`  | `<c-space>`     | Open menu, open docs if already open |
  | `i`  | `<c-e>`         | Hide menu                            |
  | `i`  | `<c-y>`         | Select and accept                    |
  | `i`  | `<c-n>/<c-p>`   | Select next/previous item            |
  | `i`  | `<tab>/<s-tab>` | Snippet forward/backward             |
  | `i`  | `<c-k>`         | Toggle signature help                |
  | `i`  | `<c-b>/<c-f>`   | Scroll docs up/down                  |
- [flash.nvim](https://github.com/folke/flash.nvim)
  | mode          | keymap      | desciption            | note                                 |
  | ------------- | ----------- | --------------------- | ------------------------------------ |
  | `n`, `x`, `o` | `<leader>j` | Flash Jump            |                                      |
  | `n`, `x`, `o` | `<leader>J` | Flash Treesitter      |                                      |
  | `n`, `x`, `o` | `<c-space>` | Incremental Selection | `<c-j>/<c-k>` to incremend/decrement |
- [neogit](https://github.com/NeogitOrg/neogit), [mini.diff](https://nvim-mini.org/mini.nvim/readmes/mini-diff)
  | mode     | keymap       | desciption          |
  | -------- | ------------ | ------------------- |
  | `n`      | `<leader>gg` | Git Open            |
  | `n`      | `<leader>gp` | Git Overlay Preview |
  | `n`, `x` | `<leader>ga` | Git Apply Hunk      |
  | `n`, `x` | `<leader>gr` | Git Reset Hunk      |
- [mini.files](https://nvim-mini.org/mini.nvim/readmes/mini-files)
  | mode                       | keymap       | description              | note                                                                                                              |
  | -------------------------- | ------------ | ------------------------ | ----------------------------------------------------------------------------------------------------------------- |
  | `n`                        | `<leader>e`  | Explorer (current file)  |                                                                                                                   |
  | `n`                        | `<leader>E`  | Explorer (cwd)           |                                                                                                                   |
  | `n` (in mini.files buffer) | `<tab>`      | Toggle Preview           |                                                                                                                   |
  | `n` (in mini.files buffer) | `gx`         | Open File (OS)           |                                                                                                                   |
  | `n` (in mini.files buffer) | `<leader>yy` | Copy File to Clipboard   | requires [wl-clipboard](https://github.com/bugaevc/wl-clipboard)                                                  |
  | `n` (in mini.files buffer) | `<leader>yp` | Copy Path to Clipboard   | requires [wl-clipboard](https://github.com/bugawvc/wl-clipboard)                                                  |
  | `n` (in mini.files buffer) | `<leader>yz` | Copy Zipped to Clipboard | requires [wl-clipboard](https://github.com/bugawvc/wl-clipboard), [zip](https://archlinux.org/packages/?name=zip) |
- [mini.pick](https://nvim-mini.org/mini.nvim/readmes/mini-pick)
  | mode | keymap       | description    |
  | ---- | ------------ | -------------- |
  | `n`  | `<leader>ff` | Find Files     |
  | `n`  | `<leader>fb` | Find Buffers   |
  | `n`  | `<leader>fg` | Find Grep Live |
  | `n`  | `<leader>ht` | Help Tags      |
  | `n`  | `<leader>hk` | Help Keymaps   |
  | `n`  | `<leader>d`  | Diagnostics    |
- [mini.sessions](https://nvim-mini.org/mini.nvim/readmes/mini-sessions)
  | mode | keymap       | description    |
  | ---- | ------------ | -------------- |
  | `n`  | `<leader>sa` | Session Add    |
  | `n`  | `<leader>ss` | Session Select |
  | `n`  | `<leader>sd` | Session Delete |
