{ config, pkgs, ... }:

{
  programs.himalaya = {
    enable = true;
  };

  accounts.email.accounts = {

    g8 = {
      address = "guifuentes8@gmail.com";
      userName = "guifuentes8@gmail.com";
      realName = "Guilherme Fuentes";
      primary = true;

      himalaya.enable = true;
      mbsync.enable = true;

      imap = {
        host = "imap.gmail.com";
        port = 993;
      };

      smtp = {
        host = "smtp.gmail.com";
        port = 587;
        tls.useStartTls = true;
      };

      passwordCommand = "${pkgs.coreutils}/bin/cat ${config.sops.secrets.gmail-g8-password.path}";

      himalaya.settings = {
        folder.aliases = {
          inbox = "INBOX";
          sent = "[Gmail]/Sent Mail";
          drafts = "[Gmail]/Drafts";
          trash = "[Gmail]/Trash";
        };
      };
    };

    gcf = {
      address = "guilherme.c.fuentes@gmail.com";
      userName = "guilherme.c.fuentes@gmail.com";
      realName = "Guilherme C. Fuentes";

      himalaya.enable = true;
      mbsync.enable = true;

      imap = {
        host = "imap.gmail.com";
        port = 993;
      };

      smtp = {
        host = "smtp.gmail.com";
        port = 587;
        tls.useStartTls = true;
      };

      passwordCommand = "${pkgs.coreutils}/bin/cat ${config.sops.secrets.gmail-gcf-password.path}";
    };
  };

  systemd.user.services.mail-sync = {
    Unit.Description = "Mail synchronization";

    Service = {
      ExecStart = "${pkgs.isync}/bin/mbsync -a";
      Type = "oneshot";
    };
  };

  systemd.user.timers.mail-sync = {
    Unit.Description = "Check mail every minute";

    Timer = {
      OnBootSec = "1m";
      OnUnitActiveSec = "1m";
    };

    Install.WantedBy = [ "timers.target" ];
  };
}
