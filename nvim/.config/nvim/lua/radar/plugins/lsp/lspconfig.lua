return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "simrat39/rust-tools.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local opts = { noremap = true, silent = true }
    local on_attach = function(_, bufnr)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<A-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
      -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
      vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "dp",
        '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
        opts
      )
      vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "dn",
        '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',
        opts
      )
      vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>e",
        "<cmd>lua vim.lsp.diagnostic.get_line_diagnostics()<CR>",
        opts
      )
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder<CR>", opts)
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder<CR>", opts)
      vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>wl",
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders))<CR>",
        opts
      )
      -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader><leader>a", "<cmd>lua require'rust-tools'.hover_actions.hover_actions()<CR>", opts)
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- html server
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- typescript server
    lspconfig["tsserver"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- css server
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- tailwindcss server
    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- python server
    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- c/c++ server
    lspconfig["clangd"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- bash server
    lspconfig["bashls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- ruby server
    lspconfig["solargraph"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- lua server (with special settings)
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    -- golang server
    lspconfig["gopls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = { "gopls" },
      settings = {
        gopls = {
          experimentalPostfixCompletions = true,
          analyses = {
            unusedparams = true,
            shadow = true,
          },
          staticcheck = true,
        },
      },
    })

    -- rust analyzer
    -- lspconfig["rust_analyzer"].setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    --   cmd = { os.getenv("HOME") .. "/.local/bin/rust-analyzer" },
    --   settings = {
    --     ["rust-analyzer"] = {
    --       diagnostics = {
    --         enable = true,
    --       },
    --       lens = {
    --         enable = true,
    --       },
    --       checkOnSave = {
    --         command = "clippy",
    --       },
    --     },
    --   },
    -- })
    require("rust-tools").setup({
      server = {
        on_attach = on_attach,
        cmd = { os.getenv("HOME") .. "/.local/bin/rust-analyzer" },
        settings = {
          ["rust-analyzer"] = {
            diagnostics = {
              enable = true,
            },
            lens = {
              enable = true,
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
      tools = {
        on_initialized = function()
          vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
            pattern = { "*.rs" },
            callback = function()
              vim.lsp.codelens.refresh()
            end,
          })
        end,
        inlay_hints = {
          -- Only show inlay hints for the current line
          only_current_line = false,

          -- Event which triggers a refersh of the inlay hints.
          -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
          -- not that this may cause higher CPU usage.
          -- This option is only respected when only_current_line and
          -- autoSetHints both are true.
          only_current_line_autocmd = "CursorHold",

          -- whether to show parameter hints with the inlay hints or not
          -- default: true
          show_parameter_hints = false,

          -- whether to show variable name before type hints with the inlay hints or not
          -- default: false
          show_variable_name = false,

          -- prefix for parameter hints
          -- default: "<-"
          parameter_hints_prefix = "  ",

          -- prefix for all the other hints (type, chaining)
          -- default: "=>"
          other_hints_prefix = "  ",

          -- whether to align to the lenght of the longest line in the file
          max_len_align = false,

          -- padding from the left if max_len_align is true
          max_len_align_padding = 1,

          -- whether to align to the extreme right or not
          right_align = false,

          -- padding from the right if right_align is true
          right_align_padding = 7,

          -- The color of the hints
          highlight = "Comment",
        },
        hover_actions = {
          auto_focus = false,
          border = "rounded",
          width = 60,
          height = 30,
        },
      },
    })
  end,
}
