-- Additional Plugins
lvim.plugins = {
  "gpanders/editorconfig.nvim",
  "sainnhe/gruvbox-material",
  "folke/tokyonight.nvim",
  "fatih/vim-go",
  "olexsmir/gopher.nvim",
  "j-hui/fidget.nvim",
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup {
        color_square_width = 2,
      }
    end,
  },
  "lvimuser/lsp-inlayhints.nvim",
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  "jose-elias-alvarez/typescript.nvim",
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup()
    end,
  },
  "mxsdev/nvim-dap-vscode-js",
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  "simrat39/rust-tools.nvim",
  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
        popup = {
          border = "rounded",
        },
      }
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    -- cmd = "Copilot",
    event = "InsertEnter",
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  "monaqa/dial.nvim",
  -- "MunifTanjim/nui.nvim",
  -- "jackMort/ChatGPT.nvim",
  -- "Bryley/neoai.nvim"
  -- {
  --   "tpope/vim-surround",

  --   -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
  --   -- setup = function()
  --     --  vim.o.timeoutlen = 500
  --   -- end
  -- },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  -- :UnicodeTable    - Print Unicode Table in new window
  "chrisbra/unicode.vim",
  -- cargo fmt
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "TabbyML/vim-tabby",
  },
  {
    "rafamadriz/friendly-snippets",
  },
  -- {
  --   "preservim/tagbar",
  -- },
  -- -- {
  -- --  "liuchengxu/vista.vim",
  -- -- },
  -- {
  --   "ziglang/zig.vim"
  -- },
  -- {
  --     "NTBBloodbath/zig-tools.nvim",
  --   -- Load zig-tools.nvim only in Zig buffers
  --   ft = "zig",
  --   config = function()
  --     -- Initialize with default config
  --     dependencies("zig-tools").init()
  --   end,
  --   dependencies = {
  --     {
  --       "akinsho/toggleterm.nvim",
  --       config = function()
  --         dependencies("toggleterm").init()
  --       end,
  --     },
  --     {
  --       "nvim-lua/plenary.nvim",
  --       module_pattern = "plenary.*"
  --     }
  --   },
  -- },
}
