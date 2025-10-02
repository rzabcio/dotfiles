return {
  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      local nvim_tmux_nav = require("nvim-tmux-navigation")
      nvim_tmux_nav.setup({
        disable_when_zoomed = false, -- defaults to false
      })
      -- somehow the following don't work, look into general ../config/keymaps.lua
      -- vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      -- vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      -- vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      -- vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      -- vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      -- vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
      --
      -- vim.keymap.set("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>")
      -- vim.keymap.set("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>")
      -- vim.keymap.set("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>")
      -- vim.keymap.set("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>")
      -- vim.keymap.set("n", "<C-\\>", "<cmd>NvimTmuxNavigateLastActive<cr>")
      -- vim.keymap.set("n", "<C-Space>", "<cmd>NvimTmuxNavigateNext<cr>")
    end,
  },
}
