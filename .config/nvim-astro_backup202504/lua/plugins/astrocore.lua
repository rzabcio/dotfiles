-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        list = true,
        listchars = "tab:  ‣,trail:␣,extends:→,precedes:←,nbsp:␣",
        mouse = "",
        -- showbreak = "↳ ",  -- show break line
        guicursor = "n-v:block-blinkwait1000-blinkon500-blinkoff500,i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff200", -- blinking cursos
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
      -- wo = {
      --   breakindent = true, -- Enable indentation at break line
      --   breakindentopt = "shift:4,min:40,sbr",
      -- },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- UI mappings
        ["<Leader>uO"] = { "<cmd>set colorcolumn=81<cr>", desc = "Set colorcolumn to 81" },
        ["<Leader>uP"] = { "<cmd>set colorcolumn=121<cr>", desc = "Set colorcolumn to 121" },

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        -- ["<Leader>b"] = { desc = "Buffers" },
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
        ["<Leader><Leader>"] = {
          function() require("telescope.builtin").buffers() end,
          desc = "Find buffers",
        },

        -- Vimwiki mappings
        -- ["<Leader>w<Leader>]"] = { "<cmd>VimwikiMakeTomorrowDiaryNote<cr>", desc = "Vimwiki -> next journal note" },
        -- ["<Leader>w<Leader>["] = { "<cmd>VimwikiMakeYesterdayDiaryNote<cr>", desc = "Vimwiki -> previous journal note" },
        -- ZK mappings
        ["<Leader>kn"] = { "<cmd>ZkNew<cr>", desc = "Zettelkasten new note" },
        -- ["<Leader>kf"] = { "<cmd>ZkNotes<cr>", desc = "Zettelkasten find" },
        ["<Leader>kf"] = { "<cmd>:Telescope zk notes<cr>", desc = "Zettelkasten find" },
        ["<Leader>kw"] = {
          "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>",
          desc = "Zettelkasten grep",
        },
        -- ["<Leader>kt"] = { "<cmd>ZkTags<cr>", desc = "Zettelkasten tags" },
        ["<Leader>kt"] = { "<cmd>:Telescope zk tags<cr>", desc = "Zettelkasten tags" },
        ["<Leader>kr"] = { "<cmd>ZkBacklinks<cr>", desc = "Zettelkasten backlinks" },
        ["<Leader>kl"] = { "<cmd>ZkLinks<cr>", desc = "Zettelkasten links" },
        ["<Leader>ko"] = { "<cmd>MkdnToggleToDo<cr>", desc = "MkdnFlow todo" },
        ["<Leader>uZ"] = {
          function()
            require("zen-mode").toggle {
              window = {
                width = 81,
              },
              plugins = {
                tmux = { enabled = true },
                twilight = { enabled = false },
                alacritty = {
                  enabled = true,
                  font = "20", -- font size
                },
              },
              on_open = function() vim.cmd [[colorscheme bamboo]] end,
              on_close = function() vim.cmd [[colorscheme neofusion]] end,
            }
          end,
          desc = "ZenMode",
        },
        ["<Leader>uT"] = {
          function() require("twilight").toggle() end,
          desc = "Twilight",
        },

        -- Oil mappings
        ["-"] = {
          function() require("oil").open() end,
          desc = "Open parent directory",
        },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
