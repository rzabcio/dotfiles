-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.bamboo-nvim" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.cyberdream-nvim" },
  -- { import = "astrocommunity.colorscheme.dracula-nvim" }, -- problems: tabs
  { import = "astrocommunity.colorscheme.eldritch-nvim" },
  { import = "astrocommunity.colorscheme.everforest" },
  -- { import = "astrocommunity.colorscheme.fluoromachine-nvim" }, -- problems: MD headers
  -- { import = "astrocommunity.colorscheme.horizon-nvim" },  -- problems: MD coolors
  { import = "astrocommunity.colorscheme.hybrid-nvim" }, -- problems: MD coolors
  { import = "astrocommunity.colorscheme.kanagawa-nvim" }, -- problems: tabs
  { import = "astrocommunity.colorscheme.kanagawa-paper-nvim" }, -- problems: tabs
  { import = "astrocommunity.colorscheme.mellifluous-nvim" },
  { import = "astrocommunity.colorscheme.melange-nvim" },
  { import = "astrocommunity.colorscheme.neofusion-nvim" }, -- problems: MD colors/headers
  -- { import = "astrocommunity.colorscheme.nightfox-nvim" },  -- problems: MD colors
  { import = "astrocommunity.colorscheme.nordic-nvim" },
  -- { import = "astrocommunity.colorscheme.oxocarbon-nvim" },  -- no MD headers
  -- { import = "astrocommunity.colorscheme.solarized-osaka-nvim" },  -- problems: MD colors, tabs
  { import = "astrocommunity.colorscheme.sonokai" }, -- no MD colors
  { import = "astrocommunity.colorscheme.tokyodark-nvim" }, -- problems: MD colors/headers
  { import = "astrocommunity.colorscheme.tokyonight-nvim" }, -- problems: MD headers
  { import = "astrocommunity.completion.codeium-nvim" },
  -- { import = "astrocommunity.completion.codeium-vim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.zen-mode-nvim" },
  { import = "astrocommunity.git.neogit" },
  -- { import = "astrocommunity.note-taking.neorg" },
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
