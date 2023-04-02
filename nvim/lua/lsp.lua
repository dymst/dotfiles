require("mason").setup()

local servers = {
  "clangd",
  "gopls",
  "lua_ls",
  "pyright",
  "tsserver",
}

-- LSP settings
-- This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, { desc = "Format current buffer with LSP" })
end

require("mason-lspconfig").setup {
  ensure_installed = servers
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  require("lspconfig")[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
