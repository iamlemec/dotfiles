-- core plugins

-- helper vars
local actions = require("telescope.actions")

-- return plugins
return {
  {
    "projekt0n/github-nvim-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        options = {
          transparent = true,
        },
      })
    end,
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

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      })
    end
  },

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close,
          },
        },
      },
    },
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      modes = {
        char = {
          keys = {},
        }
      }
    },
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
  },

  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = {
  --     indent = { enabled = true },
  --   },
  -- },

  -- smarter indent?
  {
    "nmac427/guess-indent.nvim",
    config = function()
      require('guess-indent').setup({})
    end,
  },

  -- indent / scope lines
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
      require("ibl").setup({
        indent = {
          highlight = "IndentLine",
        },
        scope = {
          enabled = false,
        },
      })
    end,
  },

  -- replace surrounding quotes, braces, etc
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
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup({})
    end,
    dependencies = {
      {
        'nvim-tree/nvim-web-devicons',
      },
    }
  },

  {
    "nanozuki/tabby.nvim",
    -- event = 'VimEnter', -- if you want lazy load, see below
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      local theme = {
        fill = "TabLineFill",
        -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
        head = "TabLine",
        current_tab = "TabLineSel",
        tab = "TabLine",
        win = "TabLine",
        tail = "TabLine",
      }
      require("tabby").setup({
        line = function(line)
          return {
            {
              { '  ', hl = theme.head },
              line.sep('', theme.head, theme.fill),
            },
            line.tabs().foreach(function(tab)
              local hl = tab.is_current() and theme.current_tab or theme.tab
              return {
                line.sep('', hl, theme.fill),
                tab.is_current() and '' or '󰆣',
                tab.number(),
                tab.name(),
                tab.close_btn(''),
                line.sep('', hl, theme.fill),
                hl = hl,
                margin = ' ',
              }
            end),
            line.spacer(),
            line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
              return {
                line.sep('', theme.win, theme.fill),
                win.is_current() and '' or '',
                win.buf_name(),
                line.sep('', theme.win, theme.fill),
                hl = theme.win,
                margin = ' ',
              }
            end),
            {
              line.sep('', theme.tail, theme.fill),
              { '  ', hl = theme.tail },
            },
            hl = theme.fill,
          }
        end,
        -- option = {}, -- setup modules' option,
      })
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gitsigns = require("gitsigns")
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end
          map('n', '<leader>f', gitsigns.toggle_word_diff)
        end
      })
    end,
  },

  -- {
  --   dir = "~/mlai/nvim_plugins/dingllm.nvim",
  --   dependencies = { 'nvim-lua/plenary.nvim' },
  --   config = function()
  --     local system_prompt =
  --       'You should replace the code that you are sent, only following the comments. Do not talk at all. Only output valid code. Do not provide any backticks that surround the code. Never ever output backticks like this ```. Any comment that is asking you for something should be removed after you satisfy them. Other comments should left alone. Do not output backticks'
  --     local helpful_prompt = 'You are a helpful assistant. What I have sent are my notes so far.'
  --     local dingllm = require('dingllm')
  --
  --     local function anthropic_help()
  --       print('anthropic_help')
  --       dingllm.invoke_llm_and_stream_into_editor({
  --         url = 'https://api.anthropic.com/v1/messages',
  --         model = 'claude-3-5-sonnet-20240620',
  --         api_key_name = 'ANTHROPIC_API_KEY',
  --         system_prompt = helpful_prompt,
  --         replace = false,
  --       }, dingllm.make_anthropic_spec_curl_args, dingllm.handle_anthropic_spec_data)
  --     end
  --
  --     local function anthropic_replace()
  --       print('anthropic replace')
  --       dingllm.invoke_llm_and_stream_into_editor({
  --         url = 'https://api.anthropic.com/v1/messages',
  --         model = 'claude-3-5-sonnet-20240620',
  --         api_key_name = 'ANTHROPIC_API_KEY',
  --         system_prompt = system_prompt,
  --         replace = true,
  --       }, dingllm.make_anthropic_spec_curl_args, dingllm.handle_anthropic_spec_data)
  --     end
  --
  --     vim.keymap.set({ 'n', 'v' }, '<leader>I', anthropic_help, { desc = 'llm anthropic_help' })
  --     vim.keymap.set({ 'n', 'v' }, '<leader>i', anthropic_replace, { desc = 'llm anthropic' })
  --   end,
  -- },

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    opts = {
      provider = "claude",
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      file_types = { "markdown", "Avante" },
    },
    ft = { "markdown", "Avante" },
  },
}
