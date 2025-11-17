{ ... }: {
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      autoEnableSources = false;
      settings = {
        snippet = {
          expand =
            "function(args) require('luasnip').lsp_expand(args.body) end";
        };
        mapping = {
          __raw = ''
            cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }),
            })
          '';
        };
        sources = {
          __raw = ''
            cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'luasnip' },
            }, {
              { name = 'buffer' },
            })
          '';
        };
        completion = { completeopt = "menuone,noinsert,noselect"; };
        formatting = { expandable_indicator = true; };
      };
    };

    lspkind = {
      enable = true;
      settings = {
        mode = "symbol_text";
        cmp = {
          maxWidth = 50;
          ellipsisChar = "...";

        };
      };

    };

    luasnip = {
      enable = true;
      filetypeExtend = {
        javascriptreact = [ "javascript" "html" ];
        typescriptreact = [ "javascript" "html" ];
      };
      fromVscode = [ { } ];
    };

  };
}
