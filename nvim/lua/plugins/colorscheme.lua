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
  -- { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },

  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup({
        background = "medium",
      })
      vim.cmd("colorscheme everforest")
    end,
  },

  -- Configure LazyVim to load everforest
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}
