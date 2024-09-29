return {
  "tpope/vim-fugitive",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>gvs", "<cmd>Gvdiffsplit!<cr>", desc = "Open a 3 way v-split merge solver" },
    { "<leader>ghs", "<cmd>Gdiffsplit!<cr>", desc = "Open a 3 way h-split merge solver" },
    { "<leader>ggl", "<cmd>diffget //2<cr>", desc = "Accept left or top" },
    { "<leader>ggr", "<cmd>diffget //3<cr>", desc = "Accept right or bottom" },
  },
}
