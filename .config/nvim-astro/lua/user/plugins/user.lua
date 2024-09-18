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
      { "<leader>T", "<cmd>TodoTelescope<cr>", desc = "Show todos in Telescope" },
    },
  },
  {
    "tpope/vim-commentary",
    event = "User AstroFile",
  },
  {
    "tpope/vim-surround",
    event = "User AstroFile",
  },
  {
    "vimwiki/vimwiki",
    event = { "BufRead *.md", "VeryLazy" },
    -- module = true,
    init = function()
      vim.g.vimwiki_list = {
        {
          path = "~/vimwiki/default",
          index = "README",
          syntax = "markdown",
          ext = ".md",
          auto_toc = 1,
          diary_frequency = "weekly",
        },
        {
          path = "~/vimwiki/rzabcio.github.io/",
          index = "index",
          syntax = "markdown",
          ext = ".md",
          auto_toc = 1,
        },
      }
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },
  -- {
  --   "xiyaowong/transparent.nvim",
  --   event = {"BufRead","VeryLazy"},
  --   opts = {
  --     groups = { -- table: default groups
  --       'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
  --       'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
  --       'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
  --       'SignColumn', 'CursorLineNr', 'EndOfBuffer',
  --     },
  --     extra_groups = {}, -- table: additional groups that should be cleared
  --     exclude_groups = {}, -- table: groups you don't want to clear
  --   }
  -- },
  {
    "mcchrish/zenbones.nvim",
    event = { "BufRead", "VeryLazy" },
    init = function()
    end,
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "jakewvincent/mkdnflow.nvim",
    init = function()
      require('mkdnflow').setup({
        modules = {
          yaml = false,
        },
        links = {
          style = 'markdown',
          name_is_source = false,
          conceal = true,
          context = 0,
          implicit_extension = nil,
          transform_implicit = false,
          transform_explicit = function(text)
            text = text:gsub(" ", "_")
            text = text:lower()
            -- text = os.date('%Y-%m-%d_')..text
            return(text)
          end,
          create_on_follow_failure = true
        },
      })
    end,
  },
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    config = function ()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<C-l>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
    end
  },
}
