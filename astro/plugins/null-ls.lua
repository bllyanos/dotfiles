return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    -- local null_ls = require "null-ls"
    --
    -- null_ls.register(null_ls.builtins.formatting.prettierd.with {
    --   command = "prettierd",
    --   filetypes = { "typescript", "typescriptreact" },
    --   condition = function(utils)
    --     return utils.root_has_file "package.json"
    --         or utils.root_has_file ".prettierrc"
    --         or utils.root_has_file ".prettierrc.json"
    --         or utils.root_has_file ".prettierrc.js"
    --   end
    -- })
    --
    -- null_ls.register(null_ls.builtins.diagnostics.eslint_d.with {
    --   command = "eslint_d",
    --   filetypes = { "typescript", "typescriptreact" },
    --   condition = function(utils)
    --     return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc.json" })
    --   end
    -- })
    --
    -- config.root_dir = require("null-ls.utils").root_pattern("package.json", ".null-ls-root", "Makefile", ".git")
    --
    -- -- config.should_attach = function(bufnr)
    -- --   return not vim.api.nvim_buf_get_name(bufnr):match("^git://")
    -- -- end
    --
    -- config.on_attach = require("astronvim.utils.lsp").on_attach
    --
    -- -- Check supported formatters and linters
    -- -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    -- config.sources = {
    --   -- Set a formatter
    --   -- null_ls.builtins.formatting.stylua,
    --   null_ls.builtins.formatting.prettierd,
    --   null_ls.builtins.diagnostics.eslint_d,
    --   null_ls.builtins.code_actions.eslint_d,
    -- }
    return config -- return final config table
  end,
}
