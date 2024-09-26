-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- EXAMPLE
local servers = { "html", "cssls", "ts_ls", "gopls", "intelephense", "angularls", "bashls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
--
local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    },
  },
}

local ok, mason_registry = pcall(require, "mason-registry")
if not ok then
  vim.notify "mason-registry could not be loaded"
  return
end

local angularls_path = mason_registry.get_package("angular-language-server"):get_install_path()

local cmd = {
  "ngserver",
  "--stdio",
  "--tsProbeLocations",
  table.concat({ angularls_path, vim.uv.cwd() }, ","),
  "--ngProbeLocations",
  table.concat({ angularls_path .. "/node_modules/@angular/language-server", vim.uv.cwd() }, ","),
}

lspconfig.angularls.setup {
  cmd = cmd,
  on_new_config = function(new_config, new_root_dir)
    new_config.cmd = cmd
  end,
  root_dir = util.root_pattern "angular.json",
}
