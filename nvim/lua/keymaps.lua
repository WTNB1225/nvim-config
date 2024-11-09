local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<Space>h", "^", opts)
map("n", "<Space>l", "$", opts)

map("i", "jj", "<Esc>", opts)
map("i", ",", ",<Space>", opts)