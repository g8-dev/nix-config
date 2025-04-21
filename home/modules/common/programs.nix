{ pkgs, config, ... }: {
  home.packages = [ pkgs.age pkgs.pfetch-rs ];

  programs = {
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
      settings.git_protocol = "https";
      extensions = [ pkgs.gh-eco ];
    };
    gh-dash.enable = true;
    git = {
      enable = true;
      lfs.enable = true;
      delta.enable = true;
      userName = "Guilherme Fuentes";
      userEmail = "guifuentes8@gmail.com";
      extraConfig = {
        http.postBuffer = "524288000";
        pull.rebase = false;
        push.autoSetupRemote = true;
        init.defaultBranch = "main";
        # Sign all commits using ssh key
        # commit.gpgsign = true;
        #  gpg.format = "ssh";
        #  user.signingkey = "~/.ssh/id_ed25519.pub";
      };
      aliases = {
        a = "add .";
        co = "checkout";
        cn = "checkout -b ";
        cm = "commit";
        ps = "push";
        pl = "pull";
        fe = "fetch";
        st = "status";
        rs = "reset HEAD~1 --hard";
      };
    };
    gpg.enable = true;
    home-manager.enable = true;
    ssh.enable = true;
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      initExtraFirst = "pfetch";
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "miloshadzic";
      };
      initExtra = ''
        unset -v SSH_ASKPASS
        export GITHUB_TOKEN=$(cat ${config.sops.secrets.github_token.path})
      '';
      shellAliases = {
        cjpg = "mogrify -format jpg *.png && rm *.png";
        pick = "xcolor | hyprpicker";
        clock = "tty-clock -c -C 6 -s -S -r -n -D";
        matrix = "cmatrix -b -f -C red";
        climabauru = "girouette -q -c '1h' -L 'pt_BR' -l 'Bauru' -u metric";
        climasp = "girouette -q -c '1h' -L 'pt_BR' -l 'São Paulo' -u metric";
        torrent = "rtorrent";
        gpt = "tgpt";
        feed = "tuifeed";
        mail = "himalaya -a guifuentes8";
        mail2 = "himalaya -a gcf";
        testnet = "speedtest-rs";
        music = "ncmpcpp";
      };
      localVariables = { FLAKE = "${config.home.homeDirectory}/nix-config"; };
    };
  };

}
