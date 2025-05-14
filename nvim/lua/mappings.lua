require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>i", "<ESC>:g/^#/#¡", { desc = "Mostrar índice en markdown."})
map("n", "n", "nzzzn", { desc = "Mantener el cursol en el centro al buscar."})
map("n", "N", "NzzzN", { desc = "Mantener el cursol en el centro al buscar."})

map("n", "<", "<gv", {  desc = "Mantener la selección al tabular."} )
map("n", ">", ">gv", {  desc = "Mantener la selección al tabular."} )

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
