{ pkgs, ... }:
let
  inherit (pkgs.vscode-utils) buildVscodeMarketplaceExtension;

  symbols = buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "symbols";
      publisher = "miguelsolorio";
      version = "0.0.24";
      sha256 = "sha256-yEE6G2e/a2/DcKq1+Vtv0YIAtWZG5LyXfZ6cbheRV1g=";
    };
  };

  kanagawa = buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "kanagawa-vscode-color-theme";
      publisher = "metaphore";
      version = "1.1.0";
      sha256 = "sha256-HjKlDzXc6HkDyNZJGK0wAdC2F6VAk3utywu0R+dI3RA=";
    };
  };

  pokemon = buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "vscode-pokemon";
      publisher = "jakobhoeg";
      version = "3.2.2";
      sha256 = "sha256-1y70n3y6ye1powXoZ7ulYV9Sv1NBW84StzAhHSoj+P4=";
    };
  };
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    mutableExtensionsDir = false;
    profiles.default = {
      enableExtensionUpdateCheck = true;
      enableUpdateCheck = true;
      extensions = with pkgs.vscode-extensions; [
        # theme
        kanagawa
        symbols
        # git
        donjayamanne.githistory
        eamodio.gitlens
        ms-vsliveshare.vsliveshare

        # lint
        dbaeumer.vscode-eslint
        esbenp.prettier-vscode
        davidanson.vscode-markdownlint

        # extra language plugins
        bradlc.vscode-tailwindcss
        naumovs.color-highlight
        jnoortheen.nix-ide

        # 4fun
        pokemon

      ];
      keybindings = [ ];
      userSettings = {
        "breadcrumbs.enabled" = true;

        "editor.fontSize" = 14;
        "editor.lineHeight" = 1.6;
        "editor.tabSize" = 2;
        "editor.minimap.enabled" = true;
        "editor.wordWrap" = "on";
        "editor.glyphMargin" = false;
        "editor.fontFamily" = "MonoLisa";
        "editor.renderLineHighlight" = "gutter";
        "editor.fontLigatures" = true;
        "editor.semanticHighlighting.enabled" = true;
        "editor.scrollbar.horizontal" = "hidden";
        "editor.scrollbar.vertical" = "hidden";
        "editor.formatOnSave" = true;
        "editor.codeActionsOnSave" = {
          "source.fixAll.eslint" = "always";
          "source.removeUnusedImports" = "always";
          "source.organizeImports" = "always";
        };

        "explorer.compactFolders" = false;
        "explorer.fileNesting.enabled" = true;
        "explorer.sortOrder" = "foldersNestsFiles";
        "explorer.confirmDelete" = false;
        "explorer.confirmDragAndDrop" = false;
        "explorer.confirmPasteNative" = false;

        "eslint.validate" = [
          "javascript"
          "javascriptreact"
          "typescript"
          "typescriptreact"
        ];

        "git.confirmSync" = false;
        "github.copilot.nextEditSuggestions.enabled" = true;

        "javascript.updateImportsOnFileMove.enabled" = "always";
        "typescript.updateImportsOnFileMove.enabled" = "always";

        "terminal.integrated.fontFamily" = "JetBrainsMonoNL Nerd Font";
        "terminal.integrated.fontSize" = 13;
        "terminal.integrated.fontLigatures.enabled" = true;

        "window.titleBarStyle" = "native";
        "window.commandCenter" = false;
        "workbench.colorTheme" = "Kanagawa Wave";
        "workbench.iconTheme" = "symbols";
        "workbench.startupEditor" = "newUntitledFile";
        "workbench.editor.labelFormat" = "short";
        "workbench.statusBar.visible" = true;
        "workbench.layoutControl.enabled" = true;

        "zenMode.fullScreen" = false;
        "zenMode.centerLayout" = false;
        "zenMode.showTabs" = "single";

        "[javascript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[jsonc]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[json]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[typescript]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };
        "[typescriptreact]" = {
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
        };

      };
    };

  };
}
