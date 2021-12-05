lua require("radar")

nnoremap <leader>ff :lua require('radar.telescope').project_files()<CR>
nnoremap <leader>df :lua require('radar.telescope').search_dotfiles()<CR>

nnoremap <leader>fs :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ")})<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>fh :lua require('telescope.builtin').help_tags()<CR>

