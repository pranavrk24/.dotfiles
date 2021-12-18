local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup {
    defaults = {
        prompt_prefix = "$ ",
        color_devicons = true,
        file_ignore_patterns = { "^.git/" },
        mappings = {
            i = {
                ['esc'] = actions.close
            }
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}

local M = {}

M.search_dotfiles = function()
    require('telescope.builtin').find_files({
        prompt_title = "<.dotfiles>",
        cwd = '~/.dotfiles',
        hidden = true
    })
end

M.project_files = function()
    local opts = {}
    local ok = pcall(require('telescope.builtin').git_files, opts)
    if not ok then require('telescope.builtin').find_files(opts) end
end

return M
