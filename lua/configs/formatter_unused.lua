local M = {
  filetype = {
    javascript = {
      require("formatter.filetypes.javascript").prettier,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
}

-- Variable to track whether formatting is enabled
local format_on_save_enabled = true

-- Function to toggle formatting on save
local function toggle_format_on_save()
  format_on_save_enabled = not format_on_save_enabled
  if format_on_save_enabled then
    print "Formatting on save is enabled."
  else
    print "Formatting on save is disabled."
  end
end

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  -- command = "FormatWriteLock",
  callback = function()
    if format_on_save_enabled then
      vim.cmd "FormatWriteLock"
    end
  end,
})

vim.api.nvim_create_user_command("ToggleFormatOnSave", toggle_format_on_save, {})

return M
