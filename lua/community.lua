-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- import/override with your plugins folder
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.git.blame-nvim" },
  { import = "astrocommunity.recipes.telescope-lsp-mappings" },

  -- disable default plugins
  -- { import = "astrocommunity.recipes.disable-tabline" },
}
