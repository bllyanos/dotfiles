return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },
  -- { "dasupradyumna/midnight.nvim", lazy = false, priority = 1000 },
  -- {
  --   "jesseleite/nvim-noirbuddy",
  --   dependencies = {
  --     { "tjdevries/colorbuddy.nvim" },
  --   },
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     -- All of your `setup(opts)` will go here
  --   },
  -- },
  -- { "kdheepak/monochrome.nvim" },
  -- {
  --   "binbandit/achroma.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     mode = "dark", -- "dark" or "light"
  --     variant = "default", -- "default" or "black" (OLED)
  --     transparent = false,
  --   },
  -- },
  -- { "slugbyte/lackluster.nvim", priority = 999 },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },

  -- Configure LazyVim to load moonfly
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "moonfly",
    },
  },
}
