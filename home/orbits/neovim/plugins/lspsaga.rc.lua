local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup {
  server_filetype_map = {
    typescript = 'typescript'
  },
  rename = {
    auto_save = true
  }
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'ge', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'gh', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gf', '<Cmd>Lspsaga finder<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga goto_definition<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
vim.keymap.set('n', 'gR', '<Cmd>Lspsaga rename ++ project<CR>', opts)
