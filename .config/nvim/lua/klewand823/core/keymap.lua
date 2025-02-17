vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap -- for conciseness

keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
keymap.set('n', '<Esc>', ':noh<Return><Esc>', { silent = true })
keymap.set('i', 'jj', '<Esc>', { silent = true })

-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Quickfix navigation
keymap.set('n', '<leader>co', '<cmd>copen<CR>', { desc = 'Open quickfix' })
keymap.set('n', '<leader>cx', '<cmd>cclose<CR>', { desc = 'Close quickfix' })
keymap.set('n', '<M-j>', '<cmd>cnext<CR>', { desc = 'Go to next item in quickfix list' })
keymap.set('n', '<M-k>', '<cmd>cprev<CR>', { desc = 'Go to previous item in quickfix list' })

-- Buffer ops
keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', { desc = 'Go to next buffer' })
keymap.set('n', '<leader>bp', '<cmd>bprev<CR>', { desc = 'Go to previous buffer' })
keymap.set('n', '<leader>bd', '<cmd>bd<CR>', { desc = 'Delete current buffer' })
keymap.set('n', '<leader>bD', '<cmd>%bd<CR>', { desc = 'Delete current buffer' })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "[S]plit window [v]ertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "[S]plit window [h]orizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- go to tag
keymap.set("n", "gt", function()
  local tag = vim.fn.expand("<cword>")
  vim.cmd("tag " .. tag)
end, { desc = "Go to tag" })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
