-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  {
    "hedyhli/markdown-toc.nvim",
    opts = {
      ft = "markdown", -- Lazy load on markdown filetype
      cmd = { "Mtoc" }, -- Or, lazy load on "Mtoc" command
      opts = {
        toc_list = {
          markers = "-",
          cycle_markers = false,
        },
      },
    },
  },
  {
    "zk-org/zk-nvim",
    config = function()
      require("zk").setup({
        vim.keymap.set("n", "<Leader>ki", "<cmd>ZkIndex<cr>"),
        vim.keymap.set("n", "<Leader>kn", "<cmd>ZkNew<cr>"),
        vim.keymap.set("n", "<Leader>kf", "<cmd>ZkNotes<cr>"),
        vim.keymap.set("n", "<Leader>kt", "<cmd>ZkTags<cr>"),
        vim.keymap.set("n", "<Leader>kr", "<cmd>ZkBacklinks<cr>"),
      })
    end,
  },
  {
    "jakewvincent/mkdnflow.nvim",
    init = function()
      require("mkdnflow").setup({
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
          symbols = { " ", "o", "x" },
          update_parents = true,
          not_started = " ",
          in_progress = "o",
          complete = "x",
        },
        perspective = {
          priority = "current",
        },
        vim.keymap.set("n", "<Leader>ko", "<cmd>MkdnToggleToDo<cr>"),
      })
    end,
  },
}
