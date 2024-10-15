return {
  'folke/which-key.nvim',
  opts = {},
  config = function()
    require('which-key').add(
      {
        { "<leader>c", group = "[C]ode" },
        { "<leader>r", group = "[R]ename" },
        { "<leader>s", group = "[S]plits" },
        { "<leader>t", group = "[T]abs" },
        { "<leader>w", group = "[W]orkspace" },
        { "<leader>j", group = "[J]ump with Harpoon" },
        { "<leader>d", group = "[D]ocument" },
        { "<leader>g", group = "[G]it" },
        { "<leader>i", group = "A[I]" },
      }
    )
    -- register which-key VISUAL mode
    -- required for visual <leader>hs (hunk stage) to work
    require('which-key').add({
      { "<leader>", group = "VISUAL <leader>", mode = "v" },
      { "<leader>h", desc = "Git [H]unk", mode = {"v", "n"} },
    }, { mode = 'v' })
  end,
}
