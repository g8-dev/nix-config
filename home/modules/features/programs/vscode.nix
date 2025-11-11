{ pkgs, ... }:
let
  inherit (pkgs.vscode-utils) buildVscodeMarketplaceExtension;

  kanagawa = buildVscodeMarketplaceExtension {
    mktplcRef = {
      name = "kanagawa";
      publisher = "qufiwefefwoyn";
      version = "1.5.1";
      sha256 = "sha256-AGGioXcK/fjPaFaWk2jqLxovUNR59gwpotcSpGNbj1c=";
    };
  };

in {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    mutableExtensionsDir = false;
    profiles.default = {
      enableExtensionUpdateCheck = true;
      enableUpdateCheck = true;
      extensions = with pkgs.vscode-extensions; [
        # theme
        teabyii.ayu
        pkief.material-icon-theme
        # git
        donjayamanne.githistory
        eamodio.gitlens
        github.copilot
        github.copilot-chat
        # lint
        dbaeumer.vscode-eslint
        esbenp.prettier-vscode

        # extra language plugins
        bradlc.vscode-tailwindcss
        naumovs.color-highlight
        jnoortheen.nix-ide

      ];
      keybindings = [ ];
      userSettings = {
        "breadcumbs.enabled" = true;

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

        "eslint.validate" =
          [ "javascript" "javascriptreact" "typescript" "typescriptreact" ];

        "git.confirmSync" = false;
        github.copilot.nextEditSuggestions.enabled = true;

        "javascript.updateImportsOnFileMove.enabled" = "always";
        "typescript.updateImportsOnFileMove.enabled" = "always";

        "terminal.integrated.fontFamily" = "JetBrainsMonoNL Nerd Font";
        "terminal.integrated.fontSize" = 13;
        "terminal.integrated.fontLigatures.enabled" = true;

        "window.titleBarStyle" = "native";
        "window.commandCenter" = false;

        "workbench.colorTheme" = "Ayu Mirage Bordered";
        "workbench.iconTheme" = "ayu";
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
        "[jsonc]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
        "[json]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
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
