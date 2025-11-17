local eslint_d = require('lint').linters.eslint_d
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

eslint_d.args = {
  args = {
    '--no-warn-ignored', -- <-- this is the key argument
    '--format',
    'json',
    '--stdin',
    '--stdin-filename',
    function()
      return vim.api.nvim_buf_get_name(0)
    end,
  },
}

require('lint').linters_by_ft = {
  markdown = { 'vale', },
  nix = { 'nix', },
  javascript = { 'eslint_d' },
  typescript = { 'eslint_d' },
  javascriptreact = { 'eslint_d' },
  typescriptreact = { 'eslint_d' },
  svelte = { 'eslint_d' },
  python = { 'pylint' },
}


vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    require("lint").try_lint()
  end,
})
