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

    colorschemes.kanagawa.enable = true;

    extraLuaPackages =
      luaPkgs: with luaPkgs; [
        lua-utils-nvim
        nvim-nio
        pathlib-nvim
      ];

    plugins = {
      codecompanion = {
        enable = true;
        settings = {
          strategies = {
            chat.adapter = "ollama";
            inline.adapter = "ollama";
            cmd.adapter = "ollama";
          };
          display.chat = {
            render_headers = false;
            show_settings = false;
          };
          adapters.http.ollama = {
            __raw = ''
                  function()
                    return require('codecompanion.adapters').extend('ollama', {
                      env = {
                        url = "http://100.66.110.85:11434",
                      },
                      schema = {
                        model = {
                          default = "deepseek-coder-v2:16b",
                        },
                        num_ctx = {
                default = 4096,      -- não aumenta, maior contexto = mais lento
              },
              num_predict = {
                default = 1024,      -- limita tamanho da resposta
              },
              temperature = {
                default = 0.1,       -- mais determinístico = mais rápido
              },
              top_p = {
                default = 0.9,
              },
              repeat_penalty = {
                default = 1.05,
              },
                      },
                    })
                  end
            '';
          };
        };
      };

      dashboard.enable = true;
      gitsigns.enable = true;
      lualine.enable = true;
      transparent.enable = true;
      web-devicons.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      zen-mode-nvim
      material-nvim
    ];

    extraPackages = with pkgs; [
      # Language servers
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted
      marksman
      tailwindcss-language-server
      lua-language-server
      nixd
      # Formatters
      ruff
      nixfmt
      prettierd
      stylua
      # Linters
      pylint
      eslint_d
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
      fileencoding = "utf-8";
      hlsearch = true;
      inccommand = "split";
      ignorecase = true;
      laststatus = 2;
      number = true;
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
      wrap = true;
    };
  };

  home.sessionVariables.EDITOR = "nvim";
}
