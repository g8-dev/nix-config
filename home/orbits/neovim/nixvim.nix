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
    colorschemes.catppuccin.enable = true;
    colorschemes.catppuccin.flavour = "mocha";

    extraLuaPackages =
      luaPkgs: with luaPkgs; [
        lua-utils-nvim
        nvim-nio
        pathlib-nvim
      ];

    plugins = {

      minuet = {
        enable = true;

        settings = {
          # Use FIM provider — best choice for qwen2.5-coder via Ollama
          provider = "openai_fim_compatible";

          # n_completions = 1 is recommended for local models to save resources
          n_completions = 1;

          # Start with 512 and increase based on your machine's capability
          context_window = 1024;

          # Throttle/debounce to avoid hammering a local model
          throttle = 1000; # ms between requests while typing
          debounce = 400; # ms of idle before triggering

          provider_options = {
            openai_fim_compatible = {
              name = "Ollama";

              # TERM is a harmless env var that's always set — used as a dummy key
              # Ollama doesn't need a real API key
              api_key = "TERM";

              end_point = "http://100.66.110.85:11434/v1/completions";
              model = "deepseek-coder-v2:16b";

              # stream = true works with Ollama + qwen2.5-coder
              stream = true;

              optional = {
                #max_tokens = 56; # keep low for speed on a 3B model
                top_p = 0.9;
              };
            };
          };
        };

        # Virtual text frontend — shows ghost text inline
        # Remove / change if you prefer nvim-cmp or blink-cmp
        virtualtext = {
          auto_trigger_ft = [ "*" ];
          keymap = {
            accept = "<Tab>";
            accept_line = "<A-a>";
            dismiss = "<Esc>";
            # Não existe "show" — use toggle
            toggle_auto_trigger = "<A-m>";
            prev = "<A-[>";
            next = "<A-]>";
          };
        };
      };
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
                       opts = {
                        stream = true,
                      },
                      schema = {
                        model = {
<<<<<<< Updated upstream
                          default = "llama3.2:3b",
                          choices = {
                            "llama3.2:3b",
                            "deepseek-coder-v2:16b",
                          },                                                  },
=======
                          default = "deepseek-coder-v2:16b"},
>>>>>>> Stashed changes
                        num_ctx = {
                default = 2048,      -- não aumenta, maior contexto = mais lento
              },
              num_predict = {
                default = 512,      -- limita tamanho da resposta
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
