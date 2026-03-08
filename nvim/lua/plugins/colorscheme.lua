return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },

  -- Configure LazyVim to load tokyonight
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
