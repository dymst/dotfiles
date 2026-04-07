# Plan: Add PNG Image Preview Support to Neovim

The goal is to enable PNG (and other image) previews within Neovim using the modern `image.nvim` plugin. This will provide in-buffer previews for images (especially in Markdown and Neorg) and can be extended to file explorers.

## Proposed Changes

### 1. Update Plugins
- Add `vhyrro/luarocks.nvim` to manage Lua dependencies like `magick`.
- Add `3rd/image.nvim` to provide the image rendering engine.
- (Optional) Add `nvim-telescope/telescope-image.nvim` if Telescope previews are desired.

### 2. Configuration
- Create `nvim/lua/image-config.lua` to configure `image.nvim`.
- Update `nvim/init.lua` to load the new configuration.

### 3. Dependencies
- Note: `image.nvim` requires `ImageMagick` and `Magick` (Lua bindings). `luarocks.nvim` will attempt to handle the Lua bindings, but `ImageMagick` must be installed on the system (e.g., via `sudo apt install imagemagick`).
- A fallback backend like `chafa` is recommended for maximum compatibility.

## Implementation Steps

### 1. Modify `nvim/lua/plugins.lua`
Add the following plugin definitions:
```lua
  -- LuaRocks for image.nvim dependencies
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },

  -- Image support
  {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
    config = function()
      -- Configuration will be handled in a separate file or here
    end,
  },
```

### 2. Create `nvim/lua/image-config.lua`
Add standard configuration for `image.nvim` with `chafa` fallback and `nvim-tree` integration.

### 3. Update `nvim/init.lua`
Add `safe_require("image-config")`.

## Verification
- Open a PNG file in Neovim.
- Check if it renders (terminal support permitting).
- Test in a Markdown file with an image link: `![image](path/to/image.png)`.
