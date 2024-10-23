-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "RRethy/nvim-treesitter-endwise",
  },
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "cpp",
      "c",
      "rust",
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
    indent = { enable = false },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        node_decremental = "<BS>",
        scope_incremental = "<TAB>",
      },
    },
  endwise = { enable = true },
  },
}
