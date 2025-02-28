require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local unmap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
unmap("n", "<leader>th", { desc = "telescope nvchad themes" })
-- map("n", "<Leader>t", ":TestFile<CR>", { desc = "Run all tests in current file" })
map("n", "<Leader>s", ":TestNearest<CR>", { desc = "Run test or test group closest to cursor" })
map("n", "<Leader>l", ":TestLast<CR>", { desc = "Re-run last test" })
map("n", "<Leader>a", ":TestSuite<CR>", { desc = "Run all tests for project" })
map("n", "<Leader>rv", ":TestVisit<CR>", { desc = "Move to last test executed" })
map("n", "<Leader>tt", ":TestFile<CR>", { desc = "Run all tests in current file" })
map("n", "<Leader>ts", ":TestNearest<CR>", { desc = "Run test or test group closest to cursor" })
map("n", "<Leader>tl", ":TestLast<CR>", { desc = "Re-run last test" })
map("n", "<Leader>ta", ":TestSuite<CR>", { desc = "Run all tests for project" })
map("n", "<Leader>tr", ":TestVisit<CR>", { desc = "Move to last test executed" })
map("n", "<Leader>tv", ":TestVisit<CR>", { desc = "Move to last test executed" })

-- Telescope
map("n", "<Leader>fs", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Telescope lsp workspace symbols" })
map("n", "<Leader>ft", "<cmd>Telescope themes<CR>", { desc = "Telescope NvChad themes" })

-- Gitsigns
map("n", "<Leader>gn", "<cmd>Gitsigns next_hunk<CR>", { desc = "Move to next Git hunk" })
map("n", "<Leader>gp", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Move to previous Git hunk" })

-- Fugitive
map("n", "<Leader>gs", "<cmd>Git<CR>", { desc = "Git status" })
map("n", "<Leader>gc", "<cmd>Git commit<CR>", { desc = "Git commit" })
map("n", "<Leader>gb", "<cmd>Git blame<CR>", { desc = "Git blame" })

-- Splits
unmap("n", "<Leader>v", { desc = "terminal new vertical window" })
unmap("n", "<Leader>h", { desc = "terminal new horizontal term" })
map("n", "<Leader>v", "<cmd>vsplit<CR>", { desc = "splits current window vertically" })
map("n", "<Leader>h", "<cmd>split<CR>", { desc = "splits current window horizontally" })

-- hop.nvim
if package.loaded.hop then
  local hop = require "hop"
  local directions = require("hop.hint").HintDirection
  map("", "f", function()
    hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true }
  end, { remap = true })
  map("", "F", function()
    hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true }
  end, { remap = true })
  map("", "t", function()
    hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }
  end, { remap = true })
  map("", "T", function()
    hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }
  end, { remap = true })
end

-- conform.nvim
-- Overrides NvChad's mapped function with our super special async version
-- map("n", "<leader>fm", function()
--   require("conform").format { lsp_fallback = true }
-- end, { desc = "general format file" })
map("n", "<leader>fm", function()
  require("conform").format { timeout_ms = 3000, lsp_format = "fallback" }
  -- require("conform").format { async = true, lsp_format = "fallback" }
end, { desc = "general format file" })

-- Replace overwritten NvChad keymaps for terminals-- new terminals
map("n", "<leader>ch", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("n", "<leader>cv", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical term" })
