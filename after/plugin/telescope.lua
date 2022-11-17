local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>ff', '<Cmd>:Telescope find_files prompt_prefix=🔍 <CR>', opts)
map('n', '<leader>bb', '<Cmd>:Telescope buffers<CR>', opts)
map('n', '<leader>F', '<Cmd>:lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>', opts)
require("telescope").load_extension("live_grep_args")

local actions = require('telescope.actions')
local telescope = require('telescope')
-- Global remapping
------------------------------
telescope.setup {
  defaults = {
    color_devicons = true,
    file_ignore_patterns = { 'node_modules' },
    mappings = {
      n = {
        ['q'] = actions.close
      },
      i = {
        -- To disable a keymap, put [map] = false
        -- So, to not map "<C-n>", just put
        ['<C-n>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
      },
    },
  }
}

-- Preview files in sidebar
telescope.load_extension('file_browser')
telescope.load_extension('live_grep_args')
