-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  -- settings --
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>uO"] = { "<cmd>set colorcolumn=81<cr>", desc = "Set colorcolumn to 81" },
          ["<Leader>uP"] = { "<cmd>set colorcolumn=121<cr>", desc = "Set colorcolumn to 121" },
          ["-"] = {
            function() require("oil").open() end,
            desc = "Open parent directory",
          },
        },
      },
    },
  },

  -- plugins --
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function() require("nvim-surround").setup {} end,
  },
  {
    "frankroeder/parrot.nvim",
    dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
    -- optionally include "folke/noice.nvim" or "rcarriga/nvim-notify" for beautiful notifications
    config = function()
      require("parrot").setup {
        -- Providers must be explicitly added to make them available.
        providers = {
          pplx = {
            api_key = os.getenv "PERPLEXITY_API_KEY",
          },
        },
      }
    end,
  }
}
