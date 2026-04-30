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
  local nmap = function(keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end
    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
  end

  -- VS Code / IntelliJ style keymaps
  nmap("F12", require("telescope.builtin").lsp_definitions, "Go to Definition (VS Code)")
  nmap("<C-b>", require("telescope.builtin").lsp_definitions, "Go to Definition (IntelliJ)")
  nmap("gd", require("telescope.builtin").lsp_definitions, "Go to Definition")
  
  nmap("<S-F12>", require("telescope.builtin").lsp_references, "Go to References (VS Code)")
  nmap("gr", require("telescope.builtin").lsp_references, "Go to References")
  
  nmap("<C-S-i>", vim.lsp.buf.implementation, "Go to Implementation")
  nmap("gi", vim.lsp.buf.implementation, "Go to Implementation")
  
  -- Refactoring
  nmap("<S-F6>", vim.lsp.buf.rename, "Rename (IntelliJ)")
  nmap("<leader>rn", vim.lsp.buf.rename, "Rename")
  nmap("<M-Enter>", vim.lsp.buf.code_action, "Code Action (IntelliJ)")
  nmap("<leader>ca", vim.lsp.buf.code_action, "Code Action")

  -- Hover & Signature
  nmap("K", vim.lsp.buf.hover, "Hover Documentation")
  nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
  nmap("<C-p>", vim.lsp.buf.signature_help, "Parameter Info")

  -- Symbols
  nmap("<C-F12>", require("telescope.builtin").lsp_document_symbols, "File Structure")
  nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
end

require("mason-lspconfig").setup {
  ensure_installed = servers
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Modern Neovim 0.11+ style using vim.lsp.config
vim.lsp.config("clangd", {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
  },
})

-- Setup other servers
for _, lsp in ipairs(servers) do
  if lsp ~= "clangd" then
    vim.lsp.config(lsp, {
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end
end

vim.lsp.enable(servers)
