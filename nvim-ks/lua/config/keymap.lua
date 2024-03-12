-- Custom keymaps

-- Basics
vim.keymap.set("n", "<leader>1", ":w<CR>")
vim.keymap.set("n", "<leader>ee", ":Explore<CR>")

-- typescript specific
vim.keymap.set("n", "<leader>lm", "<cmd>OrganizeImports<CR>", { desc = "Typescript Organize Imports" })

-- Harpoon
vim.keymap.set("n", "<leader>bh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Open Harpoon" })
vim.keymap.set("n", "<leader>bm", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Open Harpoon" })
