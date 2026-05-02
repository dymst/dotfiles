local map = vim.api.nvim_set_keymap

map('n', '<C-n>', [[:NvimTreeToggle<CR>]], {})
map('n', '<leader>m', [[:Format<CR>]], {})

local function set_telescope_keymap(key, func)
  map('n', key, string.format(':lua require("telescope.builtin").%s()<CR>', func), {})
end

set_telescope_keymap('<leader>fb', 'buffers')
set_telescope_keymap('<leader>ff', 'find_files')
set_telescope_keymap('<leader>fg', 'live_grep')
set_telescope_keymap('<leader>fh', 'help_tags')
set_telescope_keymap('<leader>fo', 'oldfiles')

-- Debugging
vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<S-F5>', function() require('dap').terminate() end, { desc = 'Debug: Stop session' })
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<S-F11>', function() require('dap').step_out() end, { desc = 'Debug: Step Out' })

-- Mnemonic alternatives (in case F-keys are captured by terminal/OS)
vim.keymap.set('n', '<leader>c', function() require('dap').continue() end, { desc = 'Debug: Continue' })
vim.keymap.set('n', '<leader>n', function() require('dap').step_over() end, { desc = 'Debug: Step Over (Next)' })
vim.keymap.set('n', '<leader>si', function() require('dap').step_into() end, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<leader>so', function() require('dap').step_out() end, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>B', function()
  require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, { desc = 'Debug: Set Breakpoint' })

-- Toggle to see last session result. Without this, if you closed the UI, you cannot see it again until next session
vim.keymap.set('n', '<F7>', function() require('dapui').toggle() end, { desc = 'Debug: See last session result.' })

-- Back and Forth Navigation
vim.keymap.set('n', '<M-Left>', '<C-o>', { desc = 'Navigate Back' })
vim.keymap.set('n', '<M-Right>', '<C-i>', { desc = 'Navigate Forward' })

