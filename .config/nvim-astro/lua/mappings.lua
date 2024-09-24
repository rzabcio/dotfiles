-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader><leader>"] = { function() require("telescope.builtin").buffers() end, desc = "Find buffers" },
    ["<leader>w["] = { "<cmd>VimwikiToggleListItem<cr>", desc = "Vimwiki todo" },
    ["<leader>w<leader>]"] = { "<cmd>VimwikiMakeTomorrowDiaryNote<cr>", desc = "Vimwiki -> next journal note" },
    ["<leader>w<leader>["] = { "<cmd>VimwikiMakeYesterdayDiaryNote<cr>", desc = "Vimwiki -> previous journal note" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["]v"] = {
      function() require("todo-comments").jump_next() end,
      desc = "Next todo comment",
    },
    ["[v"] = {
      function() require("todo-comments").jump_prev() end,
      desc = "Previous todo comment",
    },
    ["-"] = {
      function() require("oil").open() end,
      desc = "Open parent directory",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
