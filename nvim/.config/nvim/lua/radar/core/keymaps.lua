local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

keymap("", "<Space>", "<Nop>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Disable arrow keys
keymap("n", "<Up>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)
keymap("n", "<Left>", "<Nop>", opts)
keymap("n", "<Right>", "<Nop>", opts)


-- Navigation through Quick fix list
keymap("n", "<leader>cn", ":cnext<CR>", opts)
keymap("n", "<leader>cp", ":cprev<CR>", opts)

-- Resize with arrow keys
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Copying to clipboard
keymap("n", "<leader>y", "\"+y", opts)
keymap("v", "<leader>y", "\"+y", opts)
keymap("n", "<leader>Y", "gg\"+yG", opts)

-- Keep the cursor centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Better tab navigation
keymap("n", "<A-h>", ":tabprev<cr>", opts)
keymap("n", "<A-l>", ":tabnext<cr>", opts)
keymap("n", "<A-n>", ":tabnew<cr>", opts)

-- Better window navigation
keymap("n", "<C-H>", "<C-w>h", opts)
keymap("n", "<C-J>", "<C-w>j", opts)
keymap("n", "<C-K>", "<C-w>k", opts)
keymap("n", "<C-L>", "<C-w>l", opts)

keymap("n", "<leader>d", '"_d', opts)
keymap("n", "<leader>pv", ":Lex 25<cr>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Undo break points
keymap("i", ",", ",<c-g>u", opts)
keymap("i", ".", ".<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<C-k>", ":m '>-2<CR>gv=gv", opts)
keymap("v", "<leader>d", '"_d', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv=gv", opts)
keymap("x", "K", ":move '<-2<CR>gv=gv", opts)
keymap("x", "<C-j>", ":move '>+1<CR>gv=gv", opts)
keymap("x", "<C-k>", ":move '<-2<CR>gv=gv", opts)
keymap("x", "<leader>p", '"_dP', opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "jk", "<C-\\><C-n>", term_opts)
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Dap
-- keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", opts)
-- keymap("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", opts)
-- keymap("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", opts)
-- keymap("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>", opts)
-- keymap("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
-- keymap("n", "<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
-- keymap("n", "<leader>lp", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>", opts)
-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>", opts)

-- Jumplist mutations
-- nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
-- nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
