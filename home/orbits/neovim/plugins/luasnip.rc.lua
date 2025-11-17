local ls = require("luasnip")


ls.filetype_extend("javascriptreact", { "javascript", "html" })
ls.filetype_extend("typescriptreact", { "javascript", "html" })

require("luasnip.loaders.from_vscode").lazy_load()
