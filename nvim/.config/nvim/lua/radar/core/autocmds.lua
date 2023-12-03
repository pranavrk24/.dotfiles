local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlighted yank
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 75,
    })
  end
})

-- Format while saving
-- autocmd('BufWritePre', {
--   --[[ group = yank_group, ]]
--   pattern = '*',
--   callback = function()
--     vim.lsp.buf.format()
--   end
-- })
