require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
    disable = {},
    keymaps = {
      open = 'gtd' -- Opens the playground for current buffer (if applicable)
    },
    updatetime = 25 -- Debounced time for highlighting nodes in the playground from source code
  }
}

