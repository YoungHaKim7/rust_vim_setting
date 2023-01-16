-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local plugin = require('core.pack').register_plugin
local conf = require('modules.tools.config')

plugin({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    { 'nvim-lua/plenary.nvim', opt = true },
    { 'nvim-telescope/telescope-fzf-native.nvim' },
    { 'smartpde/telescope-recent-files' },
  },
})

plugin({
  'nvim-telescope/telescope-fzf-native.nvim',
  run = 'make',
  -- requires = { 'nvim-telescope/telescope.nvim' },
})

plugin({
  'smartpde/telescope-recent-files',
  -- after = 'telescope.nvim',
  -- requires = { 'nvim-telescope/telescope.nvim' },
})

plugin({
  'romgrk/barbar.nvim',
  requires = { 'kyazdani42/nvim-web-devicons' },
})

plugin({
  'akinsho/toggleterm.nvim',
  tag = '*',
  config = conf.toggleterm,
})

plugin({
  'sychen52/smart-term-esc.nvim',
  config = conf.smart_term_esc,
})

plugin({
  'ellisonleao/dotenv.nvim',
  config = function()
    require('dotenv').setup({
      enable_on_load = false,
    })
  end,
})

plugin({
  'windwp/nvim-spectre',
})

plugin({
  'kdheepak/lazygit.nvim',
})

plugin({ 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' })

plugin({
  'rbong/vim-flog',
  requires = { 'tpope/vim-fugitive' },
})
