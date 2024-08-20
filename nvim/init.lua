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

-- new highlight groups
vim.api.nvim_set_hl(0, "IndentLine", { fg = "#333333" })

-- setup lazy.nvim
require("lazy").setup("plugins", {
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },

  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- set color scheme
vim.wo.cursorline = true
vim.cmd.colorscheme "github_dark"
vim.api.nvim_set_hl(0, "LineNr", { fg = "#888888" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#3a3a3a" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff966c", bold = true })

-- backgrounds for non-transparent themes
-- vim.api.nvim_set_hl(0, "StatusLine", { fg = "#111111", bg = "#486484" })
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff966c", bg = "bg", bold = true })
-- vim.api.nvim_set_hl(0, "Normal", { bg = "#242424" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "#242424" })

-- fix notify issue
require("notify").setup({
  background_colour = "#000000",
})

-- telescope keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader><leader>", builtin.find_files, {})
vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
vim.keymap.set("n", "<leader>b", builtin.buffers, {})
vim.keymap.set("n", "<leader>h", builtin.help_tags, {})

-- comment line
vim.keymap.set("n", "<leader>c", "gcc", { remap = true })

-- clear search
vim.keymap.set("n", "<esc><esc>", "<cmd>nohlsearch<cr>")

-- close current buffer
vim.keymap.set("n", "<leader>k", "<cmd>b#<bar>bd#<cr>")

-- create new tab
vim.keymap.set("n", "<leader>t", "<cmd>tabnew<cr>")

-- scroll one line
vim.keymap.set("n", "<s-up>", "<c-y>")
vim.keymap.set("n", "<s-down>", "<c-e>")
vim.keymap.set("n", "<c-up>", "<c-u>")
vim.keymap.set("n", "<c-down>", "<c-d>")
