-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Move lines up in normal and visual mode (J/K and Arrow keys)
vim.keymap.set('n', '<A-k>', ':move -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-Up>', ':move -2<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<A-k>', ':move \'<-2<CR><CR>gv', { noremap = true, silent = true })
vim.keymap.set('v', '<A-Up>', ':move \'<-2<CR>gv', { noremap = true, silent = true })

-- Move lines down in normal and visual mode (J/K and Arrow keys)
vim.keymap.set('n', '<A-j>', ':move +1<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-Down>', ':move +1<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<A-j>', ':move \'>+1<CR><CR>gv', { noremap = true, silent = true })
vim.keymap.set('v', '<A-Down>', ':move \'>+1<CR>gv', { noremap = true, silent = true })
