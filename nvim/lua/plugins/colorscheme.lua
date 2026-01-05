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
  { "slugbyte/lackluster.nvim", priority = 999 },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "lackluster-dark",
    },
  },
}
