vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end
