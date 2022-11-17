require('octo').setup()

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- open Octo action list
map('n', '<Space>oa', '<Cmd>Octo actions<CR>', opts)
