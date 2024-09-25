-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :( 

local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
  callback = function ()
    if vim.fn.argc() == 0 then
      require("nvim-tree.api").tree.open()
    end
  end
})

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "doomchad",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

return M

