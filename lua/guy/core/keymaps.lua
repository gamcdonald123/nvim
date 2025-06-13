-- Telescope keymaps
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true, desc = "Telescope: Find files" })
vim.keymap.set("n", "<leader>r", "<cmd>Telescope treesitter<CR>", { noremap = true, silent = true, desc = "Telescope: Treesitter symbols" })
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true, desc = "Telescope: Buffers" })

-- NvimTree keymaps
vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle NvimTree" })
vim.keymap.set("n", "<leader>c", "<cmd>NvimTreeCollapse<CR>", { noremap = true, silent = true, desc = "Collapse NvimTree" })

-- Clear search highlights
vim.keymap.set("n", "<leader>h", "<cmd>noh<CR>", { noremap = true, silent = true, desc = "Clear search highlights" })

-- Yank and paste to/from clipboard
vim.keymap.set("n", "<leader>y", "\"*y", { noremap = true, silent = true, desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>p", "\"*p", { noremap = true, silent = true, desc = "Paste from clipboard" })

-- Command mode shortcut
vim.keymap.set("n", ";", ":", { noremap = true, desc = "Command mode" })

-- Lspsaga-powered LSP navigation
vim.keymap.set("n", "gd", function()
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(0, "textDocument/definition", params, function(err, result)
    if err then
      vim.notify("LSP error: " .. err.message, vim.log.levels.ERROR)
      return
    end
    if not result or vim.tbl_isempty(result) then
      vim.notify("No definition found", vim.log.levels.WARN)
      return
    end

    if vim.tbl_islist(result) and #result == 1 then
      vim.lsp.util.jump_to_location(result[1], "utf-8")
    else
      -- fallback to Telescope if multiple locations
      require("telescope.builtin").lsp_definitions()
    end
  end)
end, { desc = "Smart Go to Definition" })
vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { noremap = true, silent = true, desc = "Lspsaga: Peek definition" })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, silent = true, desc = "Lspsaga: Hover doc" })

-- Jump back in location history
vim.keymap.set("n", "<BS>", "<C-o>", { noremap = true, silent = true, desc = "Jump back in definition history" })
