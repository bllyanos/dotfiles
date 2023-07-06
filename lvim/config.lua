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
  { 'luisiacc/gruvbox-baby' },
  { 'rebelot/kanagawa.nvim' }
}

-- toggle LSP Signature
require 'lsp_signature'.setup({})

local null_ls = require "null-ls"

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint",
    filetypes = { "typescript", "typescriptreact" },
    condition = function(utils)
      return utils.root_has_file("package.json")
    end
  }
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  null_ls.builtins.formatting.deno_fmt.with({
    condition = function(utils)
      return utils.root_has_file({ "deno.json", "deno.jsonc" })
    end
  }),
  {
    command = "prettier",
    filetypes = { "typescript", "typescriptreact" },
    condition = function(utils)
      return utils.root_has_file("package.json")
    end
  },
}

-- lvim.builtin.lualine.options.theme = "gruvbox"
lvim.colorscheme = "kanagawa-wave"

vim.cmd([[
set nu rnu
]])
