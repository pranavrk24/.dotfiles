return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  opts = function()
    return {
      options = {
        close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
      },
    }
  end,
}
