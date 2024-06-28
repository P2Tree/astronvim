-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "cpp",
      "c",
      "python",
      "llvm",
      "tablegen",
      "json",
      "yaml",
      "ini",
      "vim",
      "markdown",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
