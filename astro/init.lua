local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

return {
  colorscheme = "onedark",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    formatting = {
      disabled = {
        "tsserver",
      }
    },
    servers = {
      "tsserver",
    },
    config = {
      tsserver = function()
        return {
          commands = {
            OrganizeImports = {
              organize_imports,
              description = "Organize Imports"
            }
          },
          root_dir = require("lspconfig").util.root_pattern("package.json"),
          single_file_support = false,
        }
      end
    }
  },
  plugins = {
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "tsserver" }, -- automatically install lsp
      },
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  polish = function()
    require("harpoon").setup({
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      }
    })
  end
}
