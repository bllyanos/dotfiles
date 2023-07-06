-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- lvim.lang.typescript.formatters = { { exe = "prettierd" } }

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver", "denols" })

lvim.plugins = {
  { 'ray-x/lsp_signature.nvim' },
  { 'navarasu/onedark.nvim' },
  { 'ellisonleao/gruvbox.nvim' },
  { 'luisiacc/gruvbox-baby' }
}

-- toggle LSP Signature
require 'lsp_signature'.setup({})


local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint", filetypes = { "typescript", "typescriptreact" } }
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "typescript", "typescriptreact" },
  },
}

lvim.builtin.lualine.options.theme = "gruvbox"
lvim.colorscheme = "gruvbox-baby"

vim.cmd([[
set nu rnu
]])
