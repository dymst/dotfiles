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

-- Load project-specific configurations
local function load_project_config()
  local dap = require("dap")
  local cwd = vim.fn.getcwd()
  
  -- 1. Try JSON files (VS Code format but in custom locations)
  local json_locations = {
    ".vscode/launch.json",
    ".nvim/launch.json",
    ".dap.json",
  }
  
  for _, loc in ipairs(json_locations) do
    local path = cwd .. "/" .. loc
    if vim.fn.filereadable(path) == 1 then
      require('dap.ext.vscode').load_launchjs(path, { 
        cppdbg = {'c', 'cpp'}, 
        codelldb = {'c', 'cpp'} 
      })
    end
  end

  -- 2. Try Lua-based config (most flexible)
  local lua_config = cwd .. "/.dap.lua"
  if vim.fn.filereadable(lua_config) == 1 then
    dofile(lua_config)
  end
end

-- Load config on startup
load_project_config()

-- Also reload config when switching directories (if using a plugin like 'direnv' or 'project.nvim')
vim.api.nvim_create_autocmd("DirChanged", {
  callback = function()
    load_project_config()
  end,
})

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
