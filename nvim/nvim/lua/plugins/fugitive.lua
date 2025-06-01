-- Instalación del plugin vim-fugitive.
return {
  'tpope/vim-fugitive',
  lazy = true,
  keys = { ":G", ":Git", mode = "n" },
}
