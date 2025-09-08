{ ... }:
let domain = "guifuentes8.com.br";
in {
  services.gitea = {
    enable = true;

    database.type = "postgres";
    # Enable support for Git Large File Storage
    lfs.enable = true;
    settings = {
      server = {
        DOMAIN = "gitea.${domain}";
        # You need to specify this to remove the port from URLs in the web UI.
        ROOT_URL = "https://gitea.${domain}";
        HTTP_PORT = 9114;
      };
      # You can temporarily allow registration to create an admin user.
      service.DISABLE_REGISTRATION = true;
      # Add support for actions, based on act: https://github.com/nektos/act
      # actions = {
      #   ENABLED = false;
      #   DEFAULT_ACTIONS_URL = "github";
      # };
    };
  };
}

