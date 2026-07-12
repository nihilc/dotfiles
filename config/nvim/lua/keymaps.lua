vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General
vim.keymap.set("n", "<c-s>", "<cmd>write<cr>", { desc = "Save file" })
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlighting" })
vim.keymap.set("t", "<esc><esc>", [[<c-\><c-n>]], { desc = "Exit terminal mode" })

-- Navigation
vim.keymap.set("n", "<c-d>", "<c-d>zz", { desc = "Keep screen centered when <c-d>" })
vim.keymap.set("n", "<c-u>", "<c-u>zz", { desc = "Keep screen centered when <c-u>" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Keep screen centered when jump next" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Keep screen centered when jump prev" })

-- Edition
vim.keymap.set("x", "p", "P", { desc = "Paste over selection without losing yanked text" })
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move selected lines up" })
vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })

-- UI
vim.keymap.set("n", "<leader>uw", "<cmd>set wrap!<cr>", { desc = "UI Toggle Wrap" })
vim.keymap.set("n", "<leader>ul", "<cmd>set list!<cr>", { desc = "UI Toggle List" })
