require("mason").setup()
require("mason-lspconfig").setup()
require("rust-tools").setup({
  tools = {
    on_initialized = function()
      ih.set_all()
    end,
    inlay_hints = {
      auto = true,
    },
  },
  server = {
    on_attach = function(c, b)
      ih.on_attach(c, b)
    end,
  },
})

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-K>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

local opts = {
  tools = { -- rust-tools options

    -- how to execute terminal commands
    -- options right now: termopen / quickfix
    executor = require("rust-tools.executors").termopen,

    -- callback to execute once rust-analyzer is done initializing the workspace
    -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
    on_initialized = nil,

    -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
    reload_workspace_from_cargo_toml = true,

    -- These apply to the default RustSetInlayHints command
    inlay_hints = {
      -- automatically set inlay hints (type hints)
      -- default: true
      auto = true,

      -- Only show inlay hints for the current line
      only_current_line = false,

      -- whether to show parameter hints with the inlay hints or not
      -- default: true
      show_parameter_hints = true,

      -- prefix for parameter hints
      -- default: "<-"
      parameter_hints_prefix = "<- ",

      -- prefix for all the other hints (type, chaining)
      -- default: "=>"
      other_hints_prefix = "=> ",

      -- whether to align to the length of the longest line in the file
      max_len_align = false,

      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,

      -- whether to align to the extreme right or not
      right_align = false,

      -- padding from the right if right_align is true
      right_align_padding = 7,

      -- The color of the hints
      highlight = "Comment",
    },

    -- options same as lsp hover / vim.lsp.util.open_floating_preview()
    hover_actions = {

      -- the border that is used for the hover window
      -- see vim.api.nvim_open_win()
      border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      },

      -- Maximal width of the hover window. Nil means no max.
      max_width = nil,

      -- Maximal height of the hover window. Nil means no max.
      max_height = nil,

      -- whether the hover action window gets automatically focused
      -- default: false
      auto_focus = false,
    },

    -- settings for showing the crate graph based on graphviz and the dot
    -- command
    crate_graph = {
      -- Backend used for displaying the graph
      -- see: https://graphviz.org/docs/outputs/
      -- default: x11
      backend = "x11",
      -- where to store the output, nil for no output stored (relative
      -- path from pwd)
      -- default: nil
      output = nil,
      -- true for all crates.io and external crates, false only the local
      -- crates
      -- default: true
      full = true,

      -- List of backends found on: https://graphviz.org/docs/outputs/
      -- Is used for input validation and autocompletion
      -- Last updated: 2021-08-26
      enabled_graphviz_backends = {
        "bmp",
        "cgimage",
        "canon",
        "dot",
        "gv",
        "xdot",
        "xdot1.2",
        "xdot1.4",
        "eps",
        "exr",
        "fig",
        "gd",
        "gd2",
        "gif",
        "gtk",
        "ico",
        "cmap",
        "ismap",
        "imap",
        "cmapx",
        "imap_np",
        "cmapx_np",
        "jpg",
        "jpeg",
        "jpe",
        "jp2",
        "json",
        "json0",
        "dot_json",
        "xdot_json",
        "pdf",
        "pic",
        "pct",
        "pict",
        "plain",
        "plain-ext",
        "png",
        "pov",
        "ps",
        "ps2",
        "psd",
        "sgi",
        "svg",
        "svgz",
        "tga",
        "tiff",
        "tif",
        "tk",
        "vml",
        "vmlz",
        "wbmp",
        "webp",
        "xlib",
        "x11",
      },
    },
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
  server = {
    -- standalone file support
    -- setting it to false may improve startup time
    standalone = true,
  }, -- rust-analyzer options

  -- debugging stuff
  dap = {
    adapter = {
      type = "executable",
      command = "lldb-vscode",
      name = "rt_lldb",
    },
  },
}

require('rust-tools').setup(opts)



local vim = vim
local api = vim.api

-- needed by nvim-compe
vim.o.completeopt = "menuone,noselect"

-- i sometimes use the mouse to scroll through a buffer
vim.cmd [[set mouse=a]]
-- otherwise vim replaces the content of current buffer with the new file you
-- open. Or maybe deletes the current buffer and creates a new one. Either way,
-- it makes swithcing between open files quickly a pain in the ass.
-- If i set the hidden option, i lose the line numbers for some reason. Not
-- for every file though. If i open this file, everything's fine. If i open
-- a directory and then open a js file. Boom!
vim.o.hidden = true
vim.cmd [[set report=2]]
-- took me a long time to figure out how to change the leader key in lua
vim.g.mapleader = " "

require("packer").startup(
  function()
    -- Packer can manage itself
    -- navigating the file tree
    use "preservim/nerdtree"
    -- for easily changing a line to comment
    use "preservim/nerdcommenter"
    use "wbthomason/packer.nvim"

    -- navigating the file tree

    -- use "/usr/local/opt/fzf"
    -- use "junegunn/fzf.vim"
    -- Colorscheme
    use "itchyny/lightline.vim"
    use "morhetz/gruvbox"
    use "pangloss/vim-javascript"
    use "MaxMEllon/vim-jsx-pretty"

    use "jiangmiao/auto-pairs"
    use "alvan/vim-closetag"
    use "tpope/vim-unimpaired"
    use "tpope/vim-surround"
    -- auto format files. E.g. format js files using typescript.
    use "mhartington/formatter.nvim"
    use "tpope/vim-fugitive"
    use "airblade/vim-gitgutter"
    use "hrsh7th/nvim-compe"
    use "mattn/efm-langserver"
    -- TODO - find some way to verify that vsnip works
    -- TODO - Also verify if nvim-compe works with vsnip. I don't know how they work together.
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/vim-vsnip-integ"
    -- Never remember what register contains what? vim-peekaboo to the rescue
    use "junegunn/vim-peekaboo"
    -- focus mode. Might not ever use it.
    use "junegunn/goyo.vim"
    use "junegunn/limelight.vim"
    use "tpope/vim-obsession"
    use "ryanoasis/vim-devicons"
    use {
     "nvim-treesitter/nvim-treesitter",
     run = ":TSUpdate",
    }
    use "haya14busa/is.vim"
    use "nelstrom/vim-visual-star-search"

	-- TroubleToggle = :CocDiagnostics
	use {
	  "folke/trouble.nvim",
	  requires = "kyazdani42/nvim-web-devicons",
	  config = function()
		require("trouble").setup {
		  -- your configuration comes here
		  -- or leave it empty to use the default settings
		  -- refer to the configuration section below
		}
	  end
	}

	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}
-- ~~~~~~~~Rust Setting
	-- Rust inlay-hints
	use "simrat39/inlay-hints.nvim"
	-- Rust Setting
	use "simrat39/rust-tools.nvim"
	use "vim-lua/plenary.nvim"
	use "mfussenegger/nvim-dap"


--  ~~~~~~~~~~~~~~~
  end
)

-- Plugin Setting End~~~~~~~~~~~~~~~~~~~~~~

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- inlay hint setting
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- require("core.inlay-hints").setup()

-- end~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- ~~~~~Manson Setting~~~ LSPInstall

-- require("core.mason").setup()

-- ~~~~~~~~~~


local lspconfig = require "lspconfig"

-- colorscheme
-- vim.cmd [[set termguicolors]]
api.nvim_command [[colorscheme gruvbox]]

-- so that vim-closetag works for jsx inside javascript files
vim.cmd [[
let g:closetag_filetypes = 'html,xhtml,jsx,javascript,typescript.tsx'
]]

-- Appearance
------------------------------------------------------------------------
-- relative line numbering, yo
-- number and relativenumber are window options. So doing vim.o.relativenumber = true
-- will not work
vim.wo.relativenumber = true
-- but we don't want pure relative line numbering. The line where the cursor is
-- should show absolute line number
vim.wo.number = true
-- show a bar on column 120. Going beyond 120 chars per line gets hard to read.
-- I have a linting rule in most of my projects to keep line limit to 120 chars.
-- I had no idea that colorcolumn is a window option
-- Tip: One way to find whether an option is global or window or buffer
-- try vim.o.<option_name> = 'blah' and run ex command :luafile %
-- It will tell you what the real type of the option_name should be
vim.wo.colorcolumn = "120"

-- maintain undo history between sessions
vim.cmd([[
set undofile
]])

-- Editing
-----------------------
-- doing vim.o.tabstop does not work. tabstop only works as a buffer option when trying to set with meta accessors
-- ideally, i guess they should be set per buffer depending on the type of file
-- vim.cmd [[set tabstop=4]]
-- vim.cmd [[set shiftwidth=4]]
-- vim.cmd [[set smarttab]]
-- vim.cmd [[autocmd FileType javascript setlocal ts=4 sts=4 sw=4]]
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
-- don't want case sensitive searches
vim.o.ignorecase = true
-- but still want search to be smart. If i type a upper case thing, do a case
-- sensitive blah
vim.o.smartcase = true
-- In insert mode, on pressing tab, insert 2 spaces
-- vim.o.expandtab = true
-- vim.o.smarttab = true
-- Use system clipboard
-- I don't know why this is not the default option. I am missing something.
-- TODO: Figure out a better way to copy to system clipboard and paste from
-- system clipboard.
-- TODO: I think when we do `set clipboard+=unnamedplus`, it's not concatenating
-- the string 'unnamedplus' to the option clipboard. It's add another value to
-- some object probably
vim.o.clipboard = "unnamedplus"

-- Key mappings
api.nvim_set_keymap("i", "jk", "<esc>", {noremap = true})
-- remap j and k to move across display lines and not real lines
-- api.nvim_set_keymap("n", "k", "gk", {noremap = true})
-- api.nvim_set_keymap("n", "gk", "k", {noremap = true})
-- api.nvim_set_keymap("n", "j", "gj", {noremap = true})
-- api.nvim_set_keymap("n", "gj", "j", {noremap = true})

-- i always misspell the as teh
-- iabbrev works in insert mode after i press any non-keyword after entering
-- the letter
vim.cmd [[iabbrev teh the]]

-- I like my cmd+s for saving files. In insert mode!
-- The terminal (or iterm) does not have support for anything related to
-- Command key
-- Hence need to hack stuff -
-- https://stackoverflow.com/questions/33060569/mapping-command-s-to-w-in-vim
-- api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>i", {noremap = true})
-- api.nvim_set_keymap("n", "<C-s>", ":w<CR>", {noremap = true})

-- To remove highlight from searched word
-- C-l redraws the screen. We change it so that it also removes all highlights
-- C-u so that we remove any ranges which might be there due to visual mode
api.nvim_set_keymap("n", "<C-l>", ":<C-u>noh<CR><C-l>", {noremap = true, silent = true})

-- When in terminal mode, escape will leave terminal mode and then it becomes
-- like any other vim buffer and can be switched or deleted or whatever
api.nvim_set_keymap("t", "<esc>", ":<C-\\><C-n>", {noremap = true})

-- There is not api to set a command directly
-- But there's an api to execute random vimscript - vim.nvim_exec
-- But vim.cmd or vim.api.nvim_command serve the same purpose
-- The second argument says if we want the return value from the executed
-- vimscript
vim.cmd("command! Vimrc :sp $MYVIMRC")

-- open vimrc
-- api.nvim_set_keymap("n", "<leader>ev", ":split $MYVIMRC<CR>", {noremap = true})
-- Source my vimrc file
-- TODO: i don't know how to source a lua file
-- source /path/to/lua does not work
-- api.nvim_set_keymap("n", "<leader>sv", ":luafile $MYVIMRC<CR>", {noremap = true})

vim.cmd [[ set grepprg=rg\ --vimgrep ]]

-- highlight yanked stuff. Done with native neovim api. No plugin.
-- augroup command didn't work with vim.cmd.
-- TODO: Find the difference between vim.api.nvim_command (alias vim.cmd)
-- and vim.api.nvim_exec
api.nvim_exec(
  [[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END
]],
  false
)

------ NerdTree configuration ------

-- toggle NERDTree show/hide using <C-n> and <leader>n
-- api.nvim_set_keymap("n", "<leader>n", ":NERDTreeToggle<CR>", {noremap = true}) reveal open buffer in NERDTree
-- api.nvim_set_keymap("n", "<leader>r", ":NERDTreeFind<CR>", {noremap = true})

------ file search and find in project command mappings ------
-- map Ctrl-q (terminals don't recognize ctrl-tab) (recent files) to show all
-- files in the buffer
api.nvim_set_keymap("n", "<leader>b", ":buffers<CR>", {noremap = true})
-- Ctrl-I maps to tab
-- But it destroys the C-i mapping in vim. Which is used to kind of go in and
-- used in conjunction with C-o.
-- api.nvim_set_keymap("n", "<C-b>", ":buffers<CR>", {noremap = true})
-- map ctrlp to open file search
-- api.nvim_set_keymap("n", "<C-p>", ":Files<CR>", {noremap = true})
api.nvim_set_keymap("n", "<leader>k", "<C-w>gt", {noremap = true})
api.nvim_set_keymap("n", "<leader>j", "<C-w>gT", {noremap = true})
-- go to next buffer
api.nvim_set_keymap("n", "<leader>h", ":tabfirst<cr>", {noremap = true})
api.nvim_set_keymap("n", "<leader>l", ":tablast<cr>", {noremap = true})
api.nvim_set_keymap("n", "<leader>t", ":tabnew<cr>", {noremap = true})
api.nvim_set_keymap("n", "<leader>n", ":bn<cr>", {noremap = true})
-- go to previous buffer
api.nvim_set_keymap("n", "<leader>p", ":bp<cr>", {noremap = true})
-- toggle between 2 buffers
-- api.nvim_set_keymap("n", "gb", ":b#<cr>", {noremap = true})
-- api.nvim_set_keymap("n", "<C-t>", ":GFiles<CR>", {noremap = true})
-- api.nvim_set_keymap("n", "<leader>l", ":Lines<CR>", {noremap = true})
-- api.nvim_set_keymap("n", "<leader>fg", ":Rg!", {noremap = true})
-- api.nvim_set_keymap("n", "<leader>a", ":exe 'Rg!' expand('<cword>')<CR>", {noremap = true})
-- NERDCommenter
-- add 1 space after comment delimiter
api.nvim_set_var("NERDSpaceDelims", 1)
-- shortcuts to toggle commen
api.nvim_set_keymap("n", ",c", ':call nerdcommenter#Comment(0, "toggle")<CR>', {noremap = true})
api.nvim_set_keymap("v", ",c", ':call nerdcommenter#Comment(0, "toggle")<CR>', {noremap = true})

-- auto-pairs
-- disable flymode in auto-pairs plugin. Too much magic. Comes in the way more often than note
vim.cmd [[
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'
]]

-- autocompletion
-- nvim-compe
-- so that tab select the next option in autocomplete menu
-- vim.api.nvim_set_keymap(
-- "i",
-- "<Tab>",
-- 'pumvisible() ? "<C-n>" : v:lua.check_backspace() ? "<Tab>" : "<C-r>=compe#complete()<CR>"',
-- {noremap = true, expr = true}
-- )
-- The below is copied directly from github readme of nvim-compe - https://github.com/hrsh7th/nvim-compe
-- I guess those are the default values. But if i don't put there in my init.lua file, the autocompletion doesn't
-- trigger without me pressing Ctrl-n
require "compe".setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,
  source = {
    path = true,
    buffer = true,
    calc = true,
    nvim_lsp = true,
    nvim_lua = true,
    vsnip = true,
    ultisnips = true
  }
}

-- vim-fugitive
-- Otherwise the diffs or something else looks total funky. I forgot what.
vim.cmd [[let g:fugitive_pty = 0]]
api.nvim_set_keymap("n", "<leader>gs", ":Git<CR>", {noremap = true})
api.nvim_set_keymap("n", "<leader>gb", ":Git blame<CR>", {noremap = true})

-- formatting
-- formatter.nvim
-- This plugin needs a lot of setup code. Have to add one config object for each type of file. But it's the only one
-- i could get working properly through init.lua.
require("formatter").setup(
  {
    logging = false,
    filetype = {
      typescriptreact = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
            stdin = true
          }
        end
      },
      css = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
            stdin = true
          }
        end
      },
      typescript = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
            stdin = true
          }
        end
      },
      javascript = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
            stdin = true
          }
        end
      },
      svelte = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
            stdin = true
          }
        end
      },
      json = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
            stdin = true
          }
        end
      },
      javascriptreact = {
        -- prettier
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
            stdin = true
          }
        end
      },
      rust = {
        -- Rustfmt
        function()
          return {
            exe = "rustfmt",
            args = {"--emit=stdout"},
            stdin = true
          }
        end
      },
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      }
    }
  }
)

-- format on save
vim.cmd [[
augroup FormatAutogroup
autocmd!
autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.rs,*.lua FormatWrite
augroup END
]]

local function buf_set_keymap(...)
  vim.api.nvim_buf_set_keymap(bufnr, ...)
end
local function buf_set_option(...)
  vim.api.nvim_buf_set_option(bufnr, ...)
end
local key_binding_options = {noremap = true, silent = true}

-- lsp configurations
-- The most interesting and the most hairy. Also the most unreliable. Work sometimes and then stop working suddenly.
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}

-- ~~~~~~~~~~~~~~~~~~~~~~~~
--
-- lsp configurations
-- The most interesting and the most hairy. Also the most unreliable. Work sometimes and then stop working suddenly.
-- local on_attach = function(client, bufnr)
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- 
--   -- Mappings.
--   buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", key_binding_options)
--   buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", key_binding_options)
--   buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", key_binding_options)
--   buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", key_binding_options)
--   buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", key_binding_options)
--   buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", key_binding_options)
--   buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", key_binding_options)
--   buf_set_keymap(
--     "n",
--     "<space>wl",
--     "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
--     key_binding_options
--   )
--   buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", key_binding_options)
--   buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", key_binding_options)
--   buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", key_binding_options)
--   buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", key_binding_options)
--   buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", key_binding_options)
--   buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", key_binding_options)
--   buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", key_binding_options)
--   buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", key_binding_options)
-- 
--   -- Set some keybinds conditional on server capabilities
--   if client.resolved_capabilities.document_formatting then
--     buf_set_keymap("n", "<leader>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", key_binding_options)
--   elseif client.resolved_capabilities.document_range_formatting then
--     buf_set_keymap("n", "<leader>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", key_binding_options)
--   end
-- 
--   -- Set autocommands conditional on server_capabilities
--   -- if client.resolved_capabilities.document_highlight then
--   -- vim.api.nvim_exec(
--   -- [[
--   -- hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
--   -- hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
--   -- hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
--   -- augroup lsp_document_highlight
--   -- autocmd!
--   -- autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--   -- autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--   -- augroup END
--   -- ]],
--   -- false
--   -- )
--   -- end
-- end
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- we update the lsp capabilities so that the lsps support snippets
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits"
  }
}

local current_dir = vim.fn.getcwd()
-- if string.find(current_dir, "main_service") or string.find(current_dir, "harmony") then
-- lspconfig.tsserver.setup {on_attach = on_attach}
-- print("we are in projectplace context. donot switch on lsp tsserver")
-- lspconfig.flow.setup {capabilities = capabilities, on_attach = on_attach}
-- else
lspconfig.tsserver.setup {on_attach = on_attach}
-- end

-- lspconfig.tsserver.setup { on_attach = on_attach }
lspconfig.pyls.setup {capabilities = capabilities, on_attach = on_attach}
lspconfig.rust_analyzer.setup {on_attach = on_attach}
local eslint_d = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true
  -- formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  -- formatStdin = true
}
-- prettier or eslint --fix is not working with neovim lsp
-- calling :lua vim.lsp.buf.formatting() should have worked, but never did
-- I don't know how to debug that
local prettier = {
  formatCommand = "prettier --stdin --stdin-filepath ${INPUT}",
  formatStdin = true
}

-- not sure if this one works well or not. If i want to debug by elimination, this one should go first.
-- to use efm-langserver and eslint_d, those need to be installed globally
-- brew install efm-langserver
-- npm install -g eslint_d
lspconfig.efm.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function()
    return vim.fn.getcwd()
  end,
  init_options = {
    documentFormatting = true,
    codeAction = true
  },
  settings = {
    lintDebounce = 500,
    languages = {
      javascript = {eslint_d},
      javascriptreact = {eslint_d},
      ["javascript.jsx"] = {eslint_d},
      typescript = {eslint_d},
      typescriptreact = {eslint_d},
      ["typescript.tsx"] = {eslint_d}
    }
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx"
  }
}

-- treat svelte files as html files to get syntax highlighting
vim.cmd [[
au! BufNewFile,BufRead *.svelte set ft=html
]]

-- Focus mode - goyo + limelight
-- goyo is a korean word which means silence
-- key binding
buf_set_keymap("n", "<leader>gy", ":Goyo<CR>", key_binding_options)

-- Enable limelight when entering goyo mode
-- Disable limelight when leaving goyo mode
vim.cmd [[
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
]]

-- treesitter
-- require "nvim-treesitter.configs".setup {
-- ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
-- highlight = {
-- enable = true, -- false will disable the whole extension
-- -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
-- -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
-- -- Using this option may slow down your editor, and you may see some duplicate highlights.
-- -- Instead of true it can also be a list of languages
-- additional_vim_regex_highlighting = false
-- }
-- }

-- Allow passing optional flags to Rg command
-- Otherwise Rg doesn't take any other argument than the search string
-- because of shellscape or something
vim.cmd(
  [[
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)
]]
)

-- TODO
-- 1. We need some snippet action going on. Too much manual typing going on right now. As if i love typing or something.
-- https://github.com/hrsh7th/vim-vsnip
-- 2. Have a good font. Something with ligatures. Not necessary. Just for kicks.
--
--
--
