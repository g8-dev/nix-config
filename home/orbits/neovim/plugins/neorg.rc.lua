require("neorg").setup({
  load = {
    ["core.defaults"] = {},
    ["core.concealer"] = { config = { icon_preset = "diamond" } },
    ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
    ["core.dirman"] = {
      config = {
        workspaces = {
          personal = "/home/guifuentes8/Nextcloud/Notes/personal",
          journal = "/home/guifuentes8/Nextcloud/Notes/journal",
          work = "/home/guifuentes8/Nextcloud/Notes/neovim",
          study = "/home/guifuentes8/Nextcloud/Notes/study",
        },
        default_workspace = "personal",
      },
    },
    ["core.esupports.metagen"] = { config = { author = "guifuentes8", type = "auto", update_date = true } },
    ["core.export"] = {},
    ["core.export.markdown"] = { config = { extensions = "all" } },
    ["core.integrations.nvim-cmp"] = {
      config = {
        sources = {
          { name = "neorg" },
        }
      },
    },
    ["core.highlights"] = {},
    ["core.integrations.treesitter"] = {
      config = {
        configure_parsers = true,
        install_parsers = true,
      }
    },
    ["core.journal"] = {
      config = {
        strategy = "flat",
        workspace = "journal",
      },
    },
    ["core.keybinds"] = {
      config = {
        default_keybinds = true,
        neorg_leader = ",",
      },
    },
    ["core.looking-glass"] = {},
    ["core.presenter"] = {
      config = {
        zen_mode = "zen-mode"
      }
    },
    ["core.qol.toc"] = {},
    ["core.qol.todo_items"] = {},
    ["core.summary"] = { config = { strategy = "by_path" } },
    ["core.tangle"] = { config = { report_on_empty = false } },
    ["core.ui"] = {},
  },

})

vim.wo.foldlevel = 99
vim.wo.conceallevel = 2
