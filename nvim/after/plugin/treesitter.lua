local present, nvimtreesitter = pcall(require, 'nvim-treesitter.configs')

if not present then
    return
end

nvimtreesitter.setup {
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  ensure_installed = {
    "c",
    "cpp",
    "lua",
    "html",
    "css",
    "php",
    "javascript"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    --keymaps = ovk_treesitter_keymap
  },
}
