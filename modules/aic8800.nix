{ config, pkgs, ... }:

let
aic8800-driver = pkgs.stdenv.mkDerivation {
pname = "aic8800d80";
version = "git";


src = pkgs.fetchFromGitHub {
  owner = "shenmintao";
  repo = "aic8800d80";
  rev = "main";
  hash = "sha256-77MQB1sVLixH6NAUJRHYMV/MVDmsJMxyCYDIrQ05eFc=";
};

nativeBuildInputs =
  config.boot.kernelPackages.kernel.moduleBuildDependencies
  ++ [
    pkgs.usb-modeswitch
  ];

buildPhase = ''
  make -C drivers/aic8800 \
    KDIR=${config.boot.kernelPackages.kernel.dev}/lib/modules/${config.boot.kernelPackages.kernel.modDirVersion}/build
'';

installPhase = ''
  install -Dm644 \
    drivers/aic8800/aic_load_fw/aic_load_fw.ko \
    "$out/lib/modules/${config.boot.kernelPackages.kernel.modDirVersion}/kernel/drivers/net/wireless/aic8800/aic_load_fw.ko"

  install -Dm644 \
    drivers/aic8800/aic8800_fdrv/aic8800_fdrv.ko \
    "$out/lib/modules/${config.boot.kernelPackages.kernel.modDirVersion}/kernel/drivers/net/wireless/aic8800/aic8800_fdrv.ko"

  install -Dm644 \
    drivers/aic8800/aic_zlp_quirk/aic_zlp_quirk.ko \
    "$out/lib/modules/${config.boot.kernelPackages.kernel.modDirVersion}/kernel/drivers/net/wireless/aic8800/aic_zlp_quirk.ko"

  mkdir -p "$out/lib/firmware"
  cp -r fw/aic8800* "$out/lib/firmware/"

  install -Dm644 \
    aic.rules \
    "$out/lib/udev/rules.d/99-aic8800.rules"

  substituteInPlace "$out/lib/udev/rules.d/99-aic8800.rules" \
    --replace-fail "/usr/bin/eject" "${pkgs.util-linux}/bin/eject" \
    --replace-fail "/bin/sh" "${pkgs.bash}/bin/sh" \
    --replace-fail "/usr/sbin/usb_modeswitch" "${pkgs.usb-modeswitch}/bin/usb_modeswitch" \
    --replace-fail "/usr/bin/usb_modeswitch" "${pkgs.usb-modeswitch}/bin/usb_modeswitch"
'';


};
in
{
boot.extraModulePackages = [
aic8800-driver
];

boot.kernelModules = [
"aic_zlp_quirk"
"aic_load_fw"
"aic8800_fdrv"
];

hardware.enableAllFirmware = true;

services.udev.packages = [
aic8800-driver
];
}
