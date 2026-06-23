{ config, inputs, outputs, pkgs, ... }:

{

  imports = [ ../common/users/darwin.nix ];
  networking.hostName = "saturn";

}
