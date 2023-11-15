local opts = {
  root_dir = require("lspconfig").util.root_pattern("dune-project"),
}

require("lvim.lsp.manager").setup("ocamllsp", opts)
