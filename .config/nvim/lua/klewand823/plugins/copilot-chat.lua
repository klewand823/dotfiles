return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  dependencies = {
    { "github/copilot.vim" },
    { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
  },
  build = "make tiktoken", -- Only on MacOS or Linux
  opts = {
    debug = true, -- Enable debugging
    -- See Configuration section for rest
    mappings = {
      complete = {
        detail = 'Use @<Tab> or /<Tab> for options.',
        insert ='<Tab>',
      },
      close = {
        normal = 'q',
        insert = '<C-c>'
      },
      reset = {
        normal ='<C-r>',
        insert = '<C-r>'
      },
      submit_prompt = {
        normal = '<CR>',
        insert = '<C-s>'
      },
      accept_diff = {
        normal = '<C-y>',
        insert = '<C-y>'
      },
      yank_diff = {
        normal = 'gy',
        register = '"',
      },
      show_diff = {
        normal = 'gd'
      },
      show_info = {
        normal = 'gp'
      },
      show_context = {
        normal = 'gs'
      },
    },
  },
}
