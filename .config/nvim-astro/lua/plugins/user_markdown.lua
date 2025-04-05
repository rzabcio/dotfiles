-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
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
}
