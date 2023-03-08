local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- require("radar.lsp.lsp-installer")
require("radar.lsp.handlers").setup()
require("radar.lsp.null-ls")
require("radar.lsp.mason")
