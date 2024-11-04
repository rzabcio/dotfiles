-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    enabled = false,
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  -- {
  --   "vimwiki/vimwiki",
  --   event = { "BufRead *.md", "VeryLazy" },
  --   -- module = true,
  --   init = function()
  --     vim.g.vimwiki_list = {
  --       {
  --         path = "~/vimwiki/default",
  --         index = "README",
  --         syntax = "markdown",
  --         ext = ".md",
  --         auto_toc = 1,
  --         diary_frequency = "weekly",
  --         -- ext2syntax = {'.md', 'vimwiki'}
  --       },
  --       {
  --         path = "~/vimwiki/rzabcio.github.io/",
  --         index = "index",
  --         syntax = "markdown",
  --         ext = ".md",
  --         auto_toc = 1,
  --       },
  --     }
  --   end,
  -- },
  {
    "mcchrish/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    event = { "BufRead", "VeryLazy" },
    init = function() end,
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User AstroFile",
    main = "ibl",
    opts = {
      -- indent = { char = "▏" },
      -- scope = { show_start = false, show_end = false },
      indent = { highlight = { "CursorColumn", "Whitespace" }, char = "" },
      whitespace = { highlight = { "CursorColumn", "Whitespace" }, remove_blankline_trail = false },
      scope = { enabled = false },
      exclude = {
        buftypes = {
          "nofile",
          "terminal",
        },
        filetypes = {
          "help",
          "startify",
          "aerial",
          "alpha",
          "dashboard",
          "lazy",
          "neogitstatus",
          "NvimTree",
          "neo-tree",
          "Trouble",
        },
      },
    },
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function() require("nvim-surround").setup {} end,
  },
  {
    "jakewvincent/mkdnflow.nvim",
    init = function()
      require("mkdnflow").setup {
        modules = {
          yaml = false,
        },
        links = {
          style = "markdown",
          name_is_source = false,
          conceal = true,
          context = 0,
          implicit_extension = nil,
          transform_implicit = false,
          transform_explicit = function(text)
            text = text:gsub(" ", "_")
            text = text:lower()
            -- text = os.date('%Y-%m-%d_')..text
            return text
          end,
          create_on_follow_failure = true,
        },
        perspective = {
          priority = 'current'
        },
      }
    end,
  },
  -- {
  --   "folke/twilight.nvim",
  --   opts = {
  --   }
  -- },
  -- {
  --     "letieu/hacker.nvim"
  -- }
}
