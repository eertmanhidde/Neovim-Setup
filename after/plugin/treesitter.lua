require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "json",
    "html",
    "scss",
    "javascript",
    "vue",
    "ruby",
    "svelte",
    "dart",
    "astro",
    "elixir",
    "eex",
    "heex",
  },
}
