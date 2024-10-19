return {
  "ggandor/leap.nvim",
  event = "BufReadPre",
  config = function()
    require("leap").create_default_mappings()
  end,
}
