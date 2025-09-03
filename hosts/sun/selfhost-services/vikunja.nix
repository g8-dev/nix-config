{ ... }: {
  services.vikunja = {
    enable = true;
    port = 9112;
    frontendScheme = "http";
    frontendHostname = "vikunja.guifuentes8.com.br";
    settings = { service.enableregistration = false; };
  };
}
