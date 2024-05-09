-- Custom keymaps

-- Basics
vim.keymap.set("n", "<leader>1", ":w<CR>")
vim.keymap.set("n", "<leader>ee", ":Explore<CR>")
vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>noh<CR>", { desc = "Clear highlights" })
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>", { desc = "Move line to top" })
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>", { desc = "Move line to bottom" })
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line to bottom" })
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line to top" })

-- typescript specific
vim.keymap.set("n", "<leader>lm", "<cmd>TSToolsOrganizeImports<CR>", { desc = "Typescript Organize Imports" })

-- Harpoon
vim.keymap.set("n", "<leader>bh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Open Harpoon" })
vim.keymap.set("n", "<leader>bm", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Open Harpoon" })

-- Lazygit
vim.keymap.set("n", "<leader>lg", "<C-w>v<cmd>terminal<cr>ilazygit<cr>", { desc = "Open LazyGit" })

-- Copilot
-- vim.api.nvim_set_keymap("i", "<C-U>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
