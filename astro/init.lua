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
      "denols",
      "clangd",
      "ocamllsp",
    },
    config = {
      ocamllsp = function()
        return {
          root_dir = require("lspconfig").util.root_pattern("dune-project"),
        }
      end,
      clangd = function()
        return {
          cmd = { "clangd", "--background-index", "--offset-encoding=utf-16" },
          filetypes = { "c", "cpp", "objc", "objcpp" },
          root_dir = require("lspconfig").util.root_pattern(".c-project"),
          init_options = {
            clangdFileStatus = true
          }
        }
      end,
      tsserver = function()
        return {
          filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
          commands = {
            OrganizeImports = {
              organize_imports,
              description = "Organize Imports"
            }
          },
          root_dir = require("lspconfig").util.root_pattern("package.json"),
          single_file_support = false,
        }
      end,
      denols = function()
        return {
          filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
          root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
          single_file_support = false,
          init_options = {
            unstable = true
          }
        }
      end,
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
  highlights = {
    -- set highlights for all themes
    -- use a function override to let us use lua to retrieve colors from highlight group
    -- there is no default table so we don't need to put a parameter for this function
    init = function()
      local get_hlgroup = require("astronvim.utils").get_hlgroup
      -- get highlights from highlight groups
      local normal = get_hlgroup "Normal"
      local fg, bg = normal.fg, normal.bg
      local bg_alt = get_hlgroup("Visual").bg
      local green = get_hlgroup("String").fg
      local red = get_hlgroup("Error").fg
      -- return a table of highlights for telescope based on colors gotten from highlight groups
      return {
        TelescopeBorder = { fg = bg_alt, bg = bg },
        TelescopeNormal = { bg = bg },
        TelescopePreviewBorder = { fg = bg, bg = bg },
        TelescopePreviewNormal = { bg = bg },
        TelescopePreviewTitle = { fg = bg, bg = green },
        TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
        TelescopePromptNormal = { fg = fg, bg = bg_alt },
        TelescopePromptPrefix = { fg = red, bg = bg_alt },
        TelescopePromptTitle = { fg = bg, bg = red },
        TelescopeResultsBorder = { fg = bg, bg = bg },
        TelescopeResultsNormal = { bg = bg },
        TelescopeResultsTitle = { fg = bg, bg = bg },
      }
    end,
  },
  polish = function()
    require("harpoon").setup({
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      }
    })

    vim.cmd([[
      set undodir=/lvim-undo
      set directory=/nvim-swap
    ]])

    vim.g.copilot_assume_mapped = true
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap("i", "<C-U>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
  end
}
