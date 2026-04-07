local M = {}

function M.PreviewImage(filepath)
  -- Ensure chafa is installed
  if vim.fn.executable("chafa") == 0 then
    print("chafa not found. Please install it with: sudo apt install chafa")
    return
  end

  -- Create a floating window for the preview
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
    title = " Image Preview (Press q to close) ",
    title_pos = "center",
  })

  -- Run chafa in a terminal inside the floating window
  -- --symbols=vhigh uses the highest density character set for much sharper detail
  -- --workroom=none ensures the window isn't cleared weirdly
  local cmd = string.format("chafa --format=symbols --symbols=vhigh --size=%dx%d --workroom=none '%s'; read -n 1 -s -p 'Press any key to close...'", width, height-2, filepath)
  
  vim.fn.termopen(cmd, {
    on_exit = function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end
  })

  -- Map 'q' to close the window
  vim.keymap.set('n', 'q', function()
    vim.api.nvim_win_close(win, true)
  end, { buffer = buf, silent = true })

  -- Start in insert mode to handle the 'read' command or just wait
  vim.cmd("startinsert")
end

return M
