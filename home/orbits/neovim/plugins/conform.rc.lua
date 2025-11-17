require("conform").setup({
  formatters_by_ft = {
    css = { { "prettierd", } },
    graphql = { { "prettierd", } },
    html = { { "prettierd", } },
    javascript = { { "prettierd", } },
    javascriptreact = { { "prettierd", } },
    json = { { "prettierd", } },
    lua = { "stylua" },
    markdown = { { "prettierd", } },
    nix = { "nixfmt" },
    python = { "ruff_fix", "ruff_format" },
    svelte = { { "prettierd", } },
    typescript = { { "prettierd", } },
    typescriptreact = { { "prettierd", } },
    yaml = { { "prettierd", } },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
    async = false,
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
