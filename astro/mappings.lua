return {
  n = {
    ["<leader>bh"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Open Harpoon UI" },
    ["<leader>bm"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file Harpoon" }
  }
}
