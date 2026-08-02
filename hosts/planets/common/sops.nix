{  pkgs, ... }:
{
  sops = {
    defaultSopsFile = ../../../secrets/common.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/g8/.config/sops/age/keys.txt";
    # age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    age.generateKey = true;
    secrets = {
      github-token = { };
    };
  };

  environment = {
    systemPackages = with pkgs; [ sops ];
  };
}
