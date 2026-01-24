-- Initialize lazy.vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- optionts
vim.opt.relativenumber = true

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- the colorscheme should be available when starting Neovim
    {
      "folke/tokyonight.nvim",
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      config = function()
        -- load the colorscheme here
        vim.cmd([[colorscheme tokyonight]])
      end,
    },
    {
      "nvim-telescope/telescope.nvim", version = "*",
      dependencies = {
        "nvim-lua/plenary.nvim",
        -- optional but recommended
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      },
      keys = {
        {
          "<leader>ff",
          function() require("telescope.builtin").find_files() end,
          desc = "Telescope find files",
        },
        {
          "<leader>fb",
          function() require("telescope.builtin").buffers() end,
          desc = "Telescope buffers",
        },
        {
          "<leader>fg",
          function() require("telescope.builtin").live_grep() end,
          desc = "Telescope live grep",
        },
      },
    },
    { "tpope/vim-sleuth" },
    {
      "folke/flash.nvim",
      keys = {
        {
          "s",
          mode = { "n", "x", "o" },
          function() require("flash").jump() end,
          desc = "Flash"
        },
      },
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

