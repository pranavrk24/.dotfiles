require "radar.options"
require "radar.keymaps"
require "radar.plugins"
require "radar.colorschemes"
require "radar.gitsigns"
require "radar.bufferline"
require "radar.lualine"
require "radar.telescope"
require "radar.cmp"
require "radar.lsp"
require "radar.highlights"
require "radar.treesitter"
require "radar.comment"
require "radar.autopairs"
require "radar.dap"
require "radar.neogit"
--[[ require "radar.nvim-tree" ]]

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlighted yank
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function ()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 75,
    })
  end
})
