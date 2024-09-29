require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local cmp = require "cmp"
-- map("n", ";", ":", { desc = "CMD enter command mode" })

map("i", "jk", "<ESC>")

-- move lines
-- map("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
-- map("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
-- map("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
-- map("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
-- copilot
-- map("i", "<C-l>", function()
--   require("github/copilot.vim").accept()
-- end, { desc = "Copilot accept" })

map("i", "<C-l>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

map("n", "<leader>ci", function()
  vim.api.nvim_feedkeys("ea", "n", false)
  vim.defer_fn(function()
    cmp.complete()
  end, 10)
end, {
  noremap = true,
  silent = true,
  desc = "Show code suggestion #2",
})
