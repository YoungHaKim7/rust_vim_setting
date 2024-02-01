-- lvim.builtin.cmp.formatting.source_names["copilot"] = "(Copilot)"
-- table.insert(lvim.builtin.cmp.sources, 1, { name = "copilot" })


local ok, copilot = pcall(require, "copilot")
if not ok then
  return
end

copilot.setup {
  panel = {
    enabled = true,
    auto_refresh = true,
    keymap = {
      jump_next = "<c-j>",
      jump_prev = "<c-k>",
      accept = "<c-a>",
      refresh = "r",
      open = "<M-CR>",
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4,
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<c-a>",
      accept_word = false,
      accept_line = false,
      next = "<c-j>",
      prev = "<c-k>",
      dismiss = "<C-e>",
    },
  },
}


-- local opts = { noremap = true, silent = true }
-- local keymap = vim.keymap.set
