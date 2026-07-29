return {
  {
    "folke/noice.nvim",
    opts = {
      routes = {
        {
          filter = {
            event = "lsp",
            kind = "progress",
            cond = function(message)
              local client = message.opts and message.opts.client
              return client == "basedpyright"
            end,
          },
          opts = { skip = true },
        },
      },
    },
  },
}
