return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = {
          hl = "GitSignsAdd",
          text = "",
          numhl = "GitSignsAddNr",
          linehl = "GitSignsAddLn",
        },
        change = {
          hl = "GitSignsChange",
          text = "▎",
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
        delete = {
          hl = "GitSignsDelete",
          text = "",
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn",
        },
        topdelete = {
          hl = "GitSignsDelete",
          text = "",
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn",
        },
        changedelete = {
          hl = "GitSignsChange",
          text = "▎",
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text_pos = "right_align",
      },
    },
  },
  {
    "tpope/vim-fugitive",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- set keymaps
      local opts = { noremap = true, silent = true }
      local keymap = vim.keymap.set

      keymap("n", "<leader>gs", ":G<cr>", opts) -- for git status
      keymap("n", "<leader>gj", ":diffget //3<cr>", opts) -- git conflicts - right
      keymap("n", "<leader>gf", ":diffget //2<cr>", opts) -- git conflicts - left
    end,
  },
}
