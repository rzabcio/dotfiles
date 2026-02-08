-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>k"] = { desc = "Zettelkasten" },
          ["<Leader>ki"] = { "<cmd>ZkIndex<cr>", desc = "Zettelkasten index" },
          ["<Leader>kn"] = { "<cmd>ZkNew<cr>", desc = "Zettelkasten new note" },
          ["<Leader>kf"] = { "<cmd>ZkNotes<cr>", desc = "Zettelkasten find note" },
          -- ["<Leader>kf"] = { "<cmd>:Telescope zk notes<cr>", desc = "Zettelkasten find" },
          ["<Leader>kw"] = {
            "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>",
            desc = "Zettelkasten grep notes",
          },
          ["<Leader>kt"] = { "<cmd>ZkTags<cr>", desc = "Zettelkasten tags" },
          -- ["<Leader>kt"] = { "<cmd>:Telescope zk tags<cr>", desc = "Zettelkasten tags" },
          ["<Leader>kr"] = { "<cmd>ZkBacklinks<cr>", desc = "Zettelkasten backlinks (current note)" },
          ["<Leader>kl"] = { "<cmd>ZkLinks<cr>", desc = "Zettelkasten links (current note)" },
          ["<Leader>ko"] = { "<cmd>MkdnToggleToDo<cr>", desc = "MkdnFlow todo" },
        },
      },
    },
  },

  -- plugins --
  -- NOTE: zk installed through comminity package
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
        to_do = {
          highlight = false,
          status_propagation = { up = true, down = true },
          sort = {
            on_status_change = false,
            recursive = false,
            cursor_behavior = { track = true },
          },
          statuses = {
            {
              name = 'not_started',
              marker = ' ',
              exclude_from_rotation = false,
            },
            {
              name = 'in_progress',
              marker = '-',
              exclude_from_rotation = false,
            },
            {
              name = 'complete',
              marker = { 'X', 'x' },
              exclude_from_rotation = false,
            },
          },
        },
        perspective = {
          priority = "current",
        },
      }
    end,
  },
}
