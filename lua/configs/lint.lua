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
    local diagnostics = vim.diagnostic.get(0)
    if #diagnostics > 0 then
      -- vim.cmd "Trouble diagnostics open"
      require("trouble").open "diagnostics"
    else
      require("trouble").close "diagnostics"
      -- vim.cmd "Trouble diagnostics close"
    end
  end,
})
