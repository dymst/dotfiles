-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- Add custom mapping for image preview on 'p'
  vim.keymap.set('n', 'p', function()
    local node = api.tree.get_node_under_cursor()
    if node and node.type == "file" then
      -- Snacks automatically handles Ghostty, tmux passthrough, and high-res rendering
      Snacks.image.hover()
    end
  end, opts('Preview Image'))
end

-- setup with on_attach
require("nvim-tree").setup({
  on_attach = on_attach,
})

require("nvim-web-devicons").setup {
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`

  -- globally enable different highlight colors per icon (default to true)
  -- if set to false all icons will have the default icon's color
  color_icons = true,

  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true,

  -- globally enable "strict" selection of icons - icon will be looked up in
  -- different tables, first by filename, and if not found by extension; this
  -- prevents cases when file doesn't have any extension but still gets some icon
  -- because its name happened to match some extension (default to false)
  strict = true,
}
