-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      require("nvim-tree.api").tree.open()
    end
  end,
})

---@type ChadrcConfig
local M = {}

-- for statusline to show folder
vim.cmd "highlight St_relativepath guifg=#626a83 guibg=#2a2b36"

local stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

M.ui = {
  telescope = {
    style = "bordered",
  },
  tabufline = {
    order = { "btns", "tabs", "buffers", "treeOffset" },
  },
  statusline = {
    theme = "default",
    order = { "mode", "relativepath", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    modules = {
      relativepath = function()
        local path = vim.api.nvim_buf_get_name(stbufnr())

        if path == "" then
          return ""
        end

        return "%#St_relativepath#  " .. vim.fn.expand "%:.:h" .. " /"
      end,
    },
  },
}
M.base46 = {
  theme = "tokyonight",
  transparency = true,

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    CursorLine = { bg = "grey_fg" },
    DiagnosticError = { standout = true },
    DiagnosticWarn = { standout = true },
  },
}

M.mason = {
  pkgs = {
    "eslint-lsp",
    "typescript-language-server",
    "prettierd",
    "gopls",
    "goimports",
    "gofumpt",
    "gomodifytags",
    "impl",
    "eslint_d",
    "phpcs",
    "angular-language-server",
    "bash-language-server",
    "rust-analyzer",
    "tailwindcss-language-server",
  },
}
return M
