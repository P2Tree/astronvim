return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-symbols.nvim",
    },
    config = function(plugin, opts)
      -- run the core AstroNvim configuration function with the options table
      require "astronvim.plugins.configs.telescope"(plugin, opts)
  
      -- require telescope and add custom configuration
      local telescope = require "telescope"
      telescope.setup {
        pickers = {
          buffers = {
            sort_lastused = true,
          },
        },
      }
    end,
  }
  