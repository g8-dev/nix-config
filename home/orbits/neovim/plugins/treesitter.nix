{ pkgs, lib, ... }:
{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    package = pkgs.vimPlugins.nvim-treesitter;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
    settings = {
      auto_install = false;
      autotag = true;
      ensure_installed = null;
      highlight = {
        additional_vim_regex_highlighting = true;
        custom_captures = { };
        disable = [ ];
        enable = true;
      };
      ignore_install = [ ];
      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = false;
          node_decremental = "grm";
          node_incremental = "grn";
          scope_incremental = "grc";
        };
      };
      indent = {
        enable = true;
      };
      sync_install = false;
    };
  };
}
