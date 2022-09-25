local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Opens git status screen to stage files etc.
map('n', '<Space>gs', '<Cmd>G<CR>', opts)

-- Opens git commit screen
map('n', '<Space>gc', '<Cmd>:Git commit<CR>', opts)

-- Push mah code!
map('n', '<Space>gp', '<Cmd>:Git push<CR>', opts)
