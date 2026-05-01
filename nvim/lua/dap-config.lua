local dap = require("dap")
local dapui = require("dapui")

require("mason-nvim-dap").setup({
  -- Makes a best effort to setup the various debuggers with
  -- reasonable debug configurations
  automatic_installation = true,

  -- You can provide additional configuration to the handlers,
  -- see mason-nvim-dap README for more information
  handlers = {},

  -- You'll need to check that you have the required things installed
  -- online, please don't ask me how to install them :)
  ensure_installed = {
    -- Update this to ensure that you have the debuggers for the languages you want
    "codelldb",
    "delve",
  },
})

-- Dap UI setup
-- For more information, see |:help nvim-dap-ui|
dapui.setup()

-- Set up virtual text
require("nvim-dap-virtual-text").setup()

-- Go setup
require("dap-go").setup()

-- Load VS Code launch.json if it exists
require('dap.ext.vscode').load_launchjs(nil, { cppdbg = {'c', 'cpp'}, codelldb = {'c', 'cpp'} })

dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close

-- Custom C++ configuration to prompt for arguments
dap.configurations.cpp = {
  {
    name = "Launch with Arguments",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = function()
      local args_string = vim.fn.input('Arguments: ')
      return vim.split(args_string, " +")
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.c = dap.configurations.cpp
