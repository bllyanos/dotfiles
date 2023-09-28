local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end


local opts = {
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize the imports"
    }
  },
  root_dir = require("lspconfig").util.root_pattern("package.json"),
  single_file_support = false,
}

local deno_opts = {
  root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc")
}

require("lvim.lsp.manager").setup("denols", deno_opts)
require("lvim.lsp.manager").setup("tsserver", opts)
