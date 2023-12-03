return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        file_ignore_patterns = { ".git/", "node_modules/" },
        mappings = {
          i = {
            ["<Esc>"] = actions.close,
            ["<Down>"] = actions.cycle_history_next,
            ["<Up>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local opts = { noremap = true, silent = true }
    local keymap = vim.keymap.set

    keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", opts)
    keymap("n", "<leader>fs", "<cmd>Telescope grep_string({ search = vim.fn.input('Grep for > ')})<cr>", opts)
    keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
    keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
    keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
    keymap("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
    keymap("n", "<leader>dd", "<cmd>Telescope diagnostics<cr>", opts)
  end,
  keys = {
    {
      "<leader>df",
      function()
        local builtin = require("telescope.builtin")
        builtin.find_files({
          prompt_title = "< Dotfiles >",
          cwd = "$HOME/.dots/",
          hidden = true,
        })
      end,
    },
    {
      "<leader>ff",
      function()
        local builtin = require("telescope.builtin")
        builtin.find_files({
          prompt_title = "< Project files >",
          cwd = "",
          hidden = true,
        })
      end,
    },
    {
      "<leader>gf",
      function()
        local builtin = require("telescope.builtin")
        builtin.git_files({
          prompt_title = "< Git files >",
          hidden = true,
        })
      end,
    },
    {
      "<leader>gc",
      function()
        local builtin = require("telescope.builtin")
        local actions = require("telescope.actions")
        builtin.git_branches({
          -- attach_mappings = function(_, map)
          --   map("i", "<C-d>", actions.git_delete_branch)
          --   map("i", "<C-d>", actions.git_delete_branch)
          -- end,
        })
      end,
    },
  },
}
