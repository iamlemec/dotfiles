-- core plugins

-- helper vars
local actions = require("telescope.actions")

-- return plugins
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

  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v3.x",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim",
  --   },
  --   opts = {
  --     window = {
  --       width = 30,
  --     },
  --   },
  -- },

  -- telescope close on escape
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      defaults = {
	mappings = {
	  i = {
	    ["<esc>"] = actions.close
	  }
	}
      }
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = { enabled = true },
    },
  },

  {
    "kylechui/nvim-surround",
     version = "*", -- Use for stability; omit to use `main` branch for the latest features
     event = "VeryLazy",
     config = function()
       require("nvim-surround").setup({
         -- Configuration here, or leave empty to use defaults
       })
    end,
  },

  {
    'nanozuki/tabby.nvim',
    -- event = 'VimEnter', -- if you want lazy load, see below
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      -- configs...
    end,
  },
}

