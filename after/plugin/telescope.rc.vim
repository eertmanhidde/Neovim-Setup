if !exists('g:loaded_telescope') | finish | endif

nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>bb :Telescope buffers<CR>
nnoremap <leader>F :Telescope live_grep<CR>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    color_devicons = true,
    file_ignore_patterns = { "node_modules" },
    mappings = {
      n = {
        ["q"] = actions.close
      },
      i = {
        -- To disable a keymap, put [map] = false
        -- So, to not map "<C-n>", just put
        ["<C-n>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  }
}
EOF


