local key_map = vim.api.nvim_set_keymap


local opts = {noremap = true, silent = true}

vim.g.mapleader = ' '

-- Normal Mode
key_map("n", "<leader>W", ":wqall<CR>", opts)
key_map("n", "<leader>e", ":Neotree<CR>", opts)
key_map("n", "<leader>t", ":TroubleToggle<CR>", opts)
key_map("n", "<leader>o", ":SymbolsOutline<CR>", opts)


-- Insert Mode
key_map("i","jk", "<Esc>", opts)
