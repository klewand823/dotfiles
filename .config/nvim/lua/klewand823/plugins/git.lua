return {
  "tpope/vim-fugitive",

  opts = {},

  config = function ()
    vim.keymap.set("n", "<leader>gB", "<cmd>Git blame<CR>", { desc = "[B]lame the file"})
  end
}
