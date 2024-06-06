-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local keymap = vim.keymap -- for conciseness
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
keymap.set("n", "<leader>so", "<cmd>only<CR>", { desc = "Close all splits except current" }) -- close all splits except current

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
-- keymap.set("n", "<S-L>", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
-- keymap.set("n", "<S-H>", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set(
  "n",
  "*",
  "<cmd>keepjumps normal! mi*`i<CR>",
  { desc = "Highlight all instances of word under cursor but not jump" }
)
keymap.set("n", "<leader>ra", "ggVGP", { desc = "Replace all lines of content in yank" })
-- increment/decrement numbers
keymap.set({ "n", "v" }, "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set({ "n", "v" }, "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement
