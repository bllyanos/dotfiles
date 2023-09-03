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
  { 'rebelot/kanagawa.nvim' },
  { 'folke/tokyonight.nvim' },
  { 'mxsdev/nvim-dap-vscode-js' }
}

lvim.builtin.dap.active = true
local dap = require "dap"

require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
});

dap.configurations.typescript = {
  {
    type = "node-terminal",
    request = "attach",
    name = "Attach backend debugger",
    port = 9229,
    cwd = "${workspaceFolder}",
    localRoot = "${workspaceFolder}",
    remoteRoot = "${workspaceFolder}",
  }
}

-- toggle LSP Signature
require 'lsp_signature'.setup({})

local null_ls = require "null-ls"

null_ls.setup {
  on_attach = require("lvim.lsp").common_on_attach,
  root_dir = require("null-ls.utils").root_pattern("package.json", ".null-ls-root", "Makefile", ".git")
}

require("lvim.lsp.manager").setup("cssls", {
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
    scss = {
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
    less = {
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
  },
})

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint_d",
    filetypes = { "typescript", "typescriptreact" },
    condition = function(utils)
      return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc.json" })
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
  null_ls.builtins.formatting.prettierd.with({
    command = "prettier",
    filetypes = { "typescript", "typescriptreact" },
    condition = function(utils)
      return utils.root_has_file({ "package.json", ".prettierrc.json" })
    end
  }),
}

-- lvim.builtin.lualine.options.theme = "gruvbox"
lvim.colorscheme = "kanagawa-wave"

vim.cmd([[
set nu rnu
]])
