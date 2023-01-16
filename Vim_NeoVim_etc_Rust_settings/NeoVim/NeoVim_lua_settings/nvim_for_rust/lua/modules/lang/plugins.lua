-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.lang.config')

plugin({
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  run = function()
    local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
    ts_update()
  end,
  after = 'telescope.nvim',
  config = conf.nvim_treesitter,
})

plugin({
  'p00f/nvim-ts-rainbow',
  after = 'nvim-treesitter',
})

--plugin({ 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' })

plugin({
  'williamboman/mason.nvim',
  config = conf.mason,
})

plugin({
  'williamboman/mason-lspconfig.nvim',
  config = conf.mason_lspconfig,
  after = 'nvim-lspconfig',
})

plugin({
  'simrat39/rust-tools.nvim',
  config = conf.rust_tools,
  after = 'nvim-lspconfig',
})
plugin({
  'nvim-lua/plenary.nvim',
})
plugin({
  'mfussenegger/nvim-dap',
  config = conf.dap,
})

plugin({
  'rcarriga/nvim-dap-ui',
  config = function()
    require('dapui').setup()
  end,
  requires = { 'mfussenegger/nvim-dap' },
})
