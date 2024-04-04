return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 4,
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "clangd",
        "templ",
        "lua_ls",
        "cssls",
        "html",
        "tsserver",
        "pyright",
        "bashls",
        "jsonls",
        "gopls",
        "rust_analyzer",
        "ruby_ls",
        "tailwindcss",
      },
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "eslint_d", -- js linter
        "isort",
        "black",
        "pylint",
      },
    })
  end,
}
