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
