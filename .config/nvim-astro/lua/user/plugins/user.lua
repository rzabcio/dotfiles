return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- config = function()
    --   require("todo-comments").setup {}
    -- end,
    opts = {},
    event = "User AstroFile",
    keys = {
      { "<leader>T", "<cmd>TodoTelescope<cr>", desc="[T] Todos in Telescope"}
    }
  },
  {
    "tpope/vim-commentary", event = "User AstroFile",
  },
  {
    "tpope/vim-surround", event = "User AstroFile",
  },
  {
    "vimwiki/vimwiki", event = "VeryLazy",
    init = function()
      vim.g.vimwiki_list = {
        {
          path="~/vimwiki/default",
          index="README",
          syntax="markdown",
          ext=".md",
          auto_toc=1,
          diary_frequency="weekly"
        },
      }
    end,
  },
}
