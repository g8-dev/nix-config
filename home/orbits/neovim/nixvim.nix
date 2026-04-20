{
  pkgs,
  lib,
  config,
  ...
}:
let
  fromGithub =
    rev: ref: repo:
    pkgs.vimUtils.buildVimPlugin {
      pname = "${lib.strings.sanitizeDerivationName repo}";
      version = ref;
      src = builtins.fetchGit {
        url = "${repo}";
        ref = ref;
        rev = rev;
      };
    };
in
{
  imports = [

    ./keymaps.nix
    ./settings.nix
    ./plugins/bufferline.nix
    ./plugins/cmp.nix
    ./plugins/lint.nix
    ./plugins/lsp.nix
    ./plugins/neorg.nix
    ./plugins/noice.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
    ./plugins/yazi.nix
  ];

  programs.nixvim = {
    enable = true;
    nixpkgs.useGlobalPackages = true;
    package = pkgs.neovim-unwrapped;
    colorschemes = {
      kanagawa = {
        enable = true;
      };
    };
    extraLuaPackages =
      luaPkgs: with luaPkgs; [
        lua-utils-nvim
        nvim-nio
        pathlib-nvim
      ];

    plugins = {
      codecompanion.enable = true;
      codecompanion.settings = {
        adapters = {
          openai = {
            __raw = ''
              function()
                return require("codecompanion.adapters").extend("openai", {
                  env = {
                    url = "http://100.120.97.78:1234/v1",
                    api_key = "lm-studio"
                  },
                  schema = {
                    model = {
                      default = "qwen2.5-coder-3b-instruct"
                    }
                  }
                })
              end
            '';
          };
        };

        strategies = {
          chat = {
            adapter = "openai";
          };
          inline = {
            adapter = "openai";
          };
          agent = {
            adapter = "openai";
          };
        };

        display = {
          chat = {
            render_headers = false;
            show_settings = true;
          };
        };
      };
      dashboard.enable = true;
      gitsigns.enable = true;
      lualine.enable = true;
      transparent.enable = true;
      web-devicons.enable = true; # required
    };

    extraPlugins = with pkgs.vimPlugins; [
      zen-mode-nvim
      material-nvim
    ];
    extraPackages = with pkgs; [
      # Language servers
      nodePackages.typescript-language-server # typescript
      nodePackages.vscode-langservers-extracted # html, css, javascript
      marksman # markdown
      tailwindcss-language-server # tailwindcss
      lua-language-server # lua
      nixd # nix
      # Conform
      ruff # python
      # Linters
      nixfmt
      prettierd
      pylint
      eslint_d
      stylua

      # Others
    ];

    opts = {
      ai = true;
      backup = false;
      backupskip = "/tmp";
      backspace = "start,eol,indent";
      breakindent = true;
      clipboard = "unnamedplus";
      cmdheight = 1;
      encoding = "utf-8";
      expandtab = true;
      foldmethod = "indent";
      foldlevel = 99;
      # formatoptions.append = [ "r" ];
      fileencoding = "utf-8";
      hlsearch = true;
      inccommand = "split";
      ignorecase = true;
      laststatus = 2;
      number = true;
      # path.append = [ "**" ];
      scrolloff = 999;
      shell = "zsh";
      shiftwidth = 2;
      showcmd = true;
      si = true;
      smarttab = true;
      splitbelow = true;
      splitright = true;
      tabstop = 4;
      title = true;
      #wildignore.append = [
      #   " */node_modules"
      # ];
      wrap = true;
    };

  };

  home.sessionVariables.EDITOR = "nvim";

}
