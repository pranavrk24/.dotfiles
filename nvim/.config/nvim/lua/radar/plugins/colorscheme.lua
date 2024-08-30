return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        theme = "wave",
        background = {
          dark = "wave",
          light = "lotus",
        },
      })
      -- vim.cmd.colorscheme("kanagawa")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "hard", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })
      -- vim.cmd.colorscheme("gruvbox")
    end,
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("tokyonight").setup({
        style = "moon",
        styles = {
          functions = { italic = true },
        },
        transparent = true,
        sidebars = { "qf", "vista_kind", "terminal", "packer" },
      })
      vim.cmd.colorscheme("tokyonight")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        flavour = "mocha",
        term_colors = false,
        styles = {
          -- keywords = { "italic" },
          -- functions = { "italic" },
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          lsp_trouble = true,
          mason = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
          nvimtree = true,
          harpoon = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
          which_key = true,
        },
        color_overrides = {
          mocha = {
            rosewater = "#efc9c2",
            flamingo = "#ebb2b2",
            pink = "#f2a7de",
            mauve = "#b889f4",
            red = "#ea7183",
            maroon = "#ea838c",
            peach = "#f39967",
            yellow = "#eaca89",
            green = "#96d382",
            teal = "#78cec1",
            sky = "#91d7e3",
            sapphire = "#68bae0",
            blue = "#739df2",
            lavender = "#a0a8f6",
            text = "#b5c1f1",
            subtext1 = "#a6b0d8",
            subtext0 = "#959ec2",
            overlay2 = "#848cad",
            overlay1 = "#717997",
            overlay0 = "#63677f",
            surface2 = "#505469",
            surface1 = "#3e4255",
            surface0 = "#2c2f40",
            base = "#1a1c2a",
            mantle = "#141620",
            crust = "#0e0f16",
          },
        },
      })
      -- load the colorscheme here
      -- vim.cmd.colorscheme("catppuccin")
    end,
  },
}
