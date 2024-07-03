require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<Leader>t", ':TestFile<CR>')
map("n", "<Leader>s", ':TestNearest<CR>')
map("n", "<Leader>l", ':TestLast<CR>')
map("n", "<Leader>a", ':TestSuite<CR>')
map("n", "<Leader>r", ':TestVisit<CR>')

-- Telescope
map("n", "<Leader>fs", "<cmd>Telescope lsp_workplace_symbols<CR>", { desc = "Telescope lsp workplace symbols" })
