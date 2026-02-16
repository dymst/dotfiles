require("mason").setup()

local servers = {
  "clangd",
  "gopls",
  "lua_ls",
  "pyright",
  "ts_ls",
}

-- LSP settings
-- This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
end

require("mason-lspconfig").setup {
  ensure_installed = servers
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

vim.lsp.enable(servers)
