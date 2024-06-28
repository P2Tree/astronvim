return {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.signs.delete = { text = "_" }
      opts.signs.topdelete = { text = "‾" }
      opts.signs.changedelete = { text = "~" }
      opts.signs.untracked = { text = "┆" }
      opts.current_line_blame = true
    end,
  }
  