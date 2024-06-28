-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = true, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        shiftround = true,
        wrapscan = false,
        autowrite = true,
        grepprg = "rg --vimgrep", --use rg for grep, default is 'grep -n $* /dev/null' if the system don't has rg
        swapfile = false,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
        cmp_enabled = true, -- enable completion at start
        autopairs_enabled = true, -- enable autopairs at start
        diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
        resession_enabled = false, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)

        -- used for italic in tmux
        t_ZH = "\\e[3m",
        t_ZR = "\\e[23m",

        auto_reload = true, -- auto reload buffer when changed other places
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        --- Basic ---
        -- joint two lines together
        ["T"] = { "J", desc = "Joint two lines together" },
        -- jump to head or tail of the line
        ["H"] = { "^", desc = "Jump to the head of the line" },
        ["L"] = { "$", desc = "Jump to the tail of the line" },
        -- screen tiny step up or down scroll
        ["K"] = { "<C-y>", desc = "Screen tiny step up scroll" },
        ["J"] = { "<C-e>", desc = "Screen tiny step down scroll" },
        -- screen half step up and down scroll
        ["<PageUp>"] = { "<C-u>", desc = "Screen half step up scroll", remap = true },
        ["<PageDown>"] = { "<C-d>", desc = "Screen half step down scroll", remap = true },
        -- mouse scroll with wheel
        ["<ScrollWheelUp>"] = { "<C-y>" },
        ["<ScrollWheelDown>"] = { "<C-e>" },
        -- search word under cursor without jump to next one
        ["*"] = { "<Cmd> keepjumps normal! mi*`i <CR>" },
        -- delete not cut
        ["<leader>x"] = { '"_x', desc = "Dlete and not move to register" },
        ["<leader>X"] = { '"_X', desc = "Delete and not move to register" },
        ["<leader>d"] = { '"_d', desc = "Delete and not move to register" },
        ["<leader>D"] = { '"_D', desc = "Delete and not move to register" },
        -- vertical split window
        ["\\"] = { "<Cmd> vsplit <CR>", desc = "Vertical split window" },
        ["-"] = { "<Cmd> split <CR>", desc = "Horizontal split window" },

        -- navigate buffer tabs
        ["<tab>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<S-tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        ["<Leader>c"] = false, -- close default force close buffer
        ["<Leader>o"] = false, -- close default toggle neo-tree

        --- Flash ---
        ["s"] = { function() require("flash").jump() end, desc = "Flash move" },
        ["S"] = { function() require("flash").treesitter() end, desc = "Flash treesitter move" },

        --- Notify ---
        ["<leader>ux"] = { function() require("notify").dismiss() end, desc = "Clean notify messages" },
      },
      v = {
        -- jump to head or tail of the line
        ["H"] = { "^", desc = "Jump to the head of the line" },
        ["L"] = { "$", desc = "Jump to the tail of the line" },
        -- screen tiny step up or down scroll
        ["K"] = { "<C-y>", desc = "Screen tiny step up scroll" },
        ["J"] = { "<C-e>", desc = "Screen tiny step down scroll" },
        -- screen half step up and down scroll
        ["<PageUp>"] = { "<C-u>", desc = "Screen half step up scroll", remap = true },
        ["<PageDown>"] = { "<C-d>", desc = "Screen half step down scroll", remap = true },
        -- still in visual mode after indent
        [">"] = { ">gv" },
        ["<"] = { "<gv" },
        -- mouse scroll with wheel
        ["<ScrollWheelUp>"] = { "<C-y>" },
        ["<ScrollWheelDown>"] = { "<C-e>" },
        -- paste over currently selected text without yanking it
        ["p"] = { "_dP" },
        -- delete not cut
        ["<leader>x"] = { '"_x', desc = "Delete and not move to register" },
        ["<leader>X"] = { '"_X', desc = "Delete and not move to register" },
        ["<leader>d"] = { '"_d', desc = "Delete and not move to register" },
        ["<leader>D"] = { '"_D', desc = "Delete and not move to register" },

        --- Flash ---
        ["s"] = { function() require("flash").jump() end, desc = "Flash move" },
        ["S"] = { function() require("flash").treesitter() end, desc = "Flash treesitter move" },
      },
      i = {
        -- add undo break-points
        [","] = { ",<C-g>u" },
        ["."] = { ".<C-g>u" },
        [";"] = { ";<C-g>u" },
        -- mouse scroll with wheel
        ["<ScrollWheelUp>"] = { "<C-y>" },
        ["<ScrollWheelDown>"] = { "<C-e>" },
      },
      t = {
        ["<Esc>"] = { "<Cmd> ToggleTerm <CR>", desc = "Toggle terminal" },
      },
    },
  },
}