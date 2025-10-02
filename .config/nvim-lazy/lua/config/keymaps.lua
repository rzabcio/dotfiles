-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<Esc>", { silent = true })

-- NVIM/TMUX INTEGRATION
-- (need to be defined there, because in plugin section don't work)
vim.keymap.set("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>")
vim.keymap.set("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>")
vim.keymap.set("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>")
vim.keymap.set("n", "<C-\\>", "<cmd>NvimTmuxNavigateLastActive<cr>")
vim.keymap.set("n", "<C-Space>", "<cmd>NvimTmuxNavigateNext<cr>")

vim.keymap.set("n", "-", "<cmd>Oil<cr>")
