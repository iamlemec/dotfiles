-- core plugins

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = { style = "moon" }
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = { },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
}

