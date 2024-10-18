require("lint").linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  json = { "eslint_d" },
}

require("lint").linters.eslint.ignore_files = { "*.json" }

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
  callback = function()
    require("lint").try_lint()
    -- Defer the diagnostics check to ensure linting is complete
    vim.defer_fn(function()
      vim.api.nvim_set_hl(0, "DiagnosticError", { bg = "#ff5555", fg = "#ffffff" })
      vim.api.nvim_set_hl(0, "DiagnosticWarn", { bg = "#ffaa00", fg = "#000000" })
      -- Get updated diagnostics
      local diagnostics = vim.diagnostic.get(0)
      if #diagnostics > 0 then
        vim.notify("Total errors: " .. #diagnostics, "error")
      end
    end, 1000) -- Delay the check for 200ms (adjustable if needed)
    -- local diagnostics = vim.diagnostic.get(0)
    -- if #diagnostics > 0 then
    --   -- vim.notify("This is an error message", "error")
    --   vim.notify("Total errors: " .. #diagnostics, "error")
    -- end
  end,
})
