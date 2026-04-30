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

dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close

-- Custom C++ adapter configuration (if needed, though mason-nvim-dap handles most)
-- codelldb is usually sufficient for C++ debugging on Linux.
