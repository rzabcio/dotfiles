-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.colorscheme.eldritch-nvim" },
  { import = "astrocommunity.colorscheme.everforest" },
  { import = "astrocommunity.colorscheme.kanagawa-paper-nvim" }, -- problems: tabs
  { import = "astrocommunity.colorscheme.neofusion-nvim" }, -- problems: MD colors/headers
  { import = "astrocommunity.git.blame-nvim" },
  { import = "astrocommunity.indent.indent-tools-nvim" },
  { import = "astrocommunity.note-taking.zk-nvim" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.scrolling.cinnamon-nvim" },
  -- import/override with your plugins folder
}
