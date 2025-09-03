{ ... }:
let domain = "guifuentes8.com.br";
in {
  services.homepage-dashboard = {
    enable = true;
    openFirewall = true;
    listenPort = 9000;
    allowedHosts = "*";
    services = [{
      "Services" = [
        {
          "Seafile" = {
            icon =
              "https://play-lh.googleusercontent.com/W50RgmkH3FIDswFcujAp9wWkvZL0Vqjx2cItHWcyBClAXB1Sy3m1mQHAyeoW3HGeKBBE";
            description = "Files service";
            href = "https://seafile.${domain}";
            siteMonitor = "https://seafile.${domain}";
          };
        }
        {
          "Immich" = {
            icon =
              "https://play-lh.googleusercontent.com/nJsRIdtaot1-FKH3kiRem4kjqUU1-_0hd_64qZH0BgtzUecYfWLCDfpk2nNVul8hOrw=w240-h480-rw";
            description = "Photos service";
            href = "https://immich.${domain}";
            siteMonitor = "https://immich.${domain}";
          };
        }
        {
          "Radicale" = {
            icon =
              "https://www.cloudron.io/store/icons/org.radicale.cloudronapp2.png";
            description = "CalDav service";
            href = "https://radicale.${domain}";
            siteMonitor = "https://radicale.${domain}";
          };
        }
        {
          "Navidrome" = {
            icon = "https://avatars.githubusercontent.com/u/26692192?v=4";
            description = "Music service";
            href = "https://navidrome.${domain}";
            siteMonitor = "https://navidrome.${domain}";
          };
        }
        {
          "AudioBook Shelf" = {
            icon =
              "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Audiobookshelf_Logo.svg/2048px-Audiobookshelf_Logo.svg.png";
            description = "Audiobook + Podcast service";
            href = "https://audiobookshelf.${domain}";
            siteMonitor = "https://audiobookshelf.${domain}";
          };
        }
        {
          "Flat Notes" = {
            icon =
              "https://raw.githubusercontent.com/runtipi/runtipi-appstore/master/apps/flatnotes/metadata/logo.jpg";
            description = "Note-taking service";
            href = "https://flatnotes.${domain}";
            siteMonitor = "https://flatnotes.${domain}";
          };
        }
        {
          "ConvertX" = {
            icon =
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhheyR18DT4a_JSZ7gBsrBxX9CC7U0lJ2Vug&s";
            description = "Convert images service";
            href = "https://convertx.${domain}";
            siteMonitor = "https://convertx.${domain}";
          };
        }
        {
          "MeTube" = {
            icon = "https://files.raycast.com/6w0l0p8m3uytgj1zc4bkssgalk05";
            description = "Youtube downloader service";
            href = "https://metube.${domain}";
            siteMonitor = "https://metube.${domain}";
          };
        }
        {
          "Karakeep" = {
            icon =
              "https://play-lh.googleusercontent.com/95d3e2a2-m4WVn7RYmdlOpdXJditxSpj4iVCF70aWPxJUQEP1HOdbiUg6L2GDOHfFV8";
            description = "Bookmarks + feed RSS service";
            href = "https://karakeep.${domain}";
            siteMonitor = "https://karakeep.${domain}";
          };
        }
        {
          "Vaultwarden" = {
            icon =
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQise_TS6EZCtz4EmSyIMEH5ZPAuQLrVEZgmQ&s";
            description = "Secrets service";
            href = "https://vaultwarden.${domain}";
            siteMonitor = "https://vaultwarden.${domain}";
          };
        }
        {
          "Vscode" = {
            icon =
              "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Visual_Studio_Code_1.35_icon.svg/2048px-Visual_Studio_Code_1.35_icon.svg.png";
            description = "Code editor service";
            href = "https://vscode.${domain}";
            siteMonitor = "https://vscode.${domain}";
          };
        }
        {
          "Vikunja" = {
            icon =
              "https://community.vikunja.io/uploads/default/original/1X/894bd400d7c5bde78a65ba02e326798ccfb82006.png";
            description = "Board and Tasks service";
            href = "https://vikunja.${domain}";
            siteMonitor = "https://vikunja.${domain}";
          };
        }
        {
          "Excalidraw" = {
            icon = "https://docs.excalidraw.com/img/logo.svg";
            description = "Draw service";
            href = "https://excalidraw.${domain}";
            siteMonitor = "https://excalidraw.${domain}";
          };
        }
      ];
    }];

    widgets = [
      {
        resources = {
          cpu = true;
          disk = "/var/lib/storage";
          memory = true;
        };
      }
      {
        search = {
          provider = "duckduckgo";
          target = "_blank";
        };
      }
    ];

    settings = {
      title = "G8 Sunlab";
      description = "G8 Sun homelab dashboard for my server!";
      background.image =
        "https://images2.alphacoders.com/538/thumb-1920-538932.jpg";
      cardBlur = "xl";
      favicon =
        "https://img.icons8.com/external-smashingstocks-flat-smashing-stocks/66/external-sun-summer-party-smashingstocks-flat-smashing-stocks.png";
      statusStyle = "dot";
      theme = "dark";
      headerStyle = "underlined";
      disableCollapse = true;
      layout = [{
        "Services" = {
          style = "row";
          columns = 2;
        };
      }];
    };
  };
}
