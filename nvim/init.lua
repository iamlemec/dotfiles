-- lazyvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- relative line numbering
vim.wo.number = true
vim.wo.relativenumber = true

-- Setup lazy.nvim
require("lazy").setup("plugins", {
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },

  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- set colorscheme
vim.cmd.colorscheme "tokyonight"
vim.api.nvim_set_hl(0, 'LineNr', { fg = "fg", bold = true })

