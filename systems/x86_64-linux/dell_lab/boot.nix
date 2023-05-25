{ config, pkgs, ... }:{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.plymouth = { enable = true; };
  boot.initrd.secrets = { "/crypto_keyfile.bin" = null; };
  boot.kernelModules = [ "kvm-intel" ];
}
