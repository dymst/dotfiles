# Modern C++ and Go Debugging/Navigation Setup for Neovim

## Objective
Upgrade the Neovim configuration to provide an industry-standard, robust environment for C++ and Go development, specifically focusing on advanced Language Server Protocol (LSP) navigation and Debug Adapter Protocol (DAP) capabilities.

## Key Files & Context
- `nvim/lua/plugins.lua`: Manage new DAP dependencies.
- `nvim/lua/lsp.lua`: Enhance LSP keybindings for navigation.
- `nvim/lua/keymaps.lua`: Add global debugger keybindings.
- `nvim/lua/formatting.lua`: Add C++ formatting support.
- `nvim/lua/dap.lua`: (New file) Configure DAP clients, UI, and Mason integration.
- `nvim/init.lua`: Source the new DAP module.

## Implementation Steps

1. **Update Plugin Manager (`nvim/lua/plugins.lua`)**
   - Add `mfussenegger/nvim-dap`.
   - Add `rcarriga/nvim-dap-ui` and `nvim-neotest/nvim-nio` (required by dap-ui).
   - Add `theHamsta/nvim-dap-virtual-text`.
   - Add `jay-boman/mason-nvim-dap.nvim` to auto-install debuggers alongside LSP servers.
   - Add `leoluz/nvim-dap-go` for Go-specific configurations.

2. **Enhance LSP Navigation (`nvim/lua/lsp.lua`)**
   - Update the `on_attach` function to define local buffer keymaps when an LSP server connects:
     - `gd` -> Go to definition (`vim.lsp.buf.definition()`)
     - `K` -> Hover documentation (`vim.lsp.buf.hover()`)
     - `gr` -> Go to references via Telescope (`require('telescope.builtin').lsp_references()`)
     - `<leader>ca` -> Code action (`vim.lsp.buf.code_action()`)
     - `<leader>rn` -> Rename (`vim.lsp.buf.rename()`)

3. **Configure Debugging (`nvim/lua/dap.lua`)**
   - Create this new file.
   - Initialize `mason-nvim-dap` to ensure `codelldb` (C++) and `delve` (Go) are installed.
   - Setup `nvim-dap-ui` and bind it to automatically open/close on DAP events.
   - Setup `nvim-dap-virtual-text`.
   - Setup `nvim-dap-go`.

4. **Define Global Keymaps (`nvim/lua/keymaps.lua`)**
   - Add F-keys for debugger control:
     - `<F5>` -> `dap.continue()`
     - `<F10>` -> `dap.step_over()`
     - `<F11>` -> `dap.step_into()`
     - `<F12>` -> `dap.step_out()`
   - Add `<leader>b` -> `dap.toggle_breakpoint()`.
   - Add `<leader>du` -> `dapui.toggle()`.

5. **Update Formatting (`nvim/lua/formatting.lua`)**
   - Add `cpp = { "clang-format" },` to the `formatters_by_ft` table.
   - Add `c = { "clang-format" },` as well.

6. **Initialize DAP (`nvim/init.lua`)**
   - Add `safe_require("dap")` to ensure the new configuration is loaded on startup.

## Verification & Testing
- Open Neovim and run `:Lazy sync` to install the new plugins.
- Run `:Mason` to verify `codelldb` and `delve` are installed.
- Open a C++ or Go file and verify LSP navigation keys (`gd`, `K`) function correctly.
- Place a breakpoint (`<leader>b`) and start a debug session (`<F5>`) to verify the DAP UI opens and attaches correctly.