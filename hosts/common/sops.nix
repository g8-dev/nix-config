{ config, pkgs, ... }:
{
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/g8/.config/sops/age/keys.txt";
    # age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    age.generateKey = true;
    secrets = {

    };
  };

  environment = {
    systemPackages = with pkgs; [ sops ];
  };
}
