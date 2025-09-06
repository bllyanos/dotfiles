return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      rufo = {
        command = "rufo", -- Or the full path, e.g., "/usr/local/bin/rubyfmt"
      },
    },
    formatters_by_ft = {
      eruby = { "erb_format" },
      ruby = { "rufo" },
      markdown = { "markdownlint" },
      yaml = { "yamlfix" },
      javascript = { "prettierd", "prettier" },
      typescript = { "prettierd", "prettier" },
      json = { "jq" },
    },
  },
}
