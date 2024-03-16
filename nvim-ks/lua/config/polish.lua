-- Harpoon
require("harpoon").setup({
	menu = {
		width = vim.api.nvim_win_get_width(0) - 4,
	},
})

vim.cmd([[
  set undodir=/lvim-undo
  set directory=/nvim-swap
]])

-- Copilot
vim.g.copilot_assume_mapped = true
vim.g.copilot_no_tab_map = true

-- Indentation
vim.cmd([[
  set expandtab
  set shiftwidth=2
  set tabstop=2
  set smartindent
  set autoindent
  set smarttab
  set softtabstop=2
]])
