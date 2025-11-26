# Plugins

**Workflow**
- [mini.files](https://nvim-mini.org/mini.nvim/readmes/mini-files) Navigate and manipulate file system
- [mini.sessions](https://nvim-mini.org/mini.nvim/readmes/mini-sessions)

**Appearance**
- [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) ColorScheme
- [mini.icons](https://nvim-mini.org/mini.nvim/readmes/mini-icons) Icon provider
- [mini.indentscope](https://nvim-mini.org/mini.nvim/readmes/mini-indentscope) Visualize and work with indent scope

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
