return {
  "rcarriga/nvim-notify",
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local notify = require "notify"
    -- this for transparency
    notify.setup { background_colour = "#000000" }
    -- this overwrites the vim notify function
    vim.notify = notify.notify
    -- require("telescope").extensions.notify.notify()
    require("telescope").load_extension "notify"
  end,
}
