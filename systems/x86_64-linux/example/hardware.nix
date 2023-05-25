{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];
  boot.plymouth.enable = true;

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/7a2cecc8-994b-4d1a-8ece-d551bd6e8934";
    fsType = "ext4";
  };

  boot.initrd = {
    luks.devices."root" = {
      device = "/dev/disk/by-uuid/9e56ed11-d281-4439-9b9d-a99eba30c275";
      preLVM = true;
      allowDiscards = true;
    };
    luks.devices."nix-stor" = {
      device = "/dev/disk/by-uuid/17b41ea9-1038-479b-bdbc-147ed1940efe";
      keyFile = "/keyfile0.bin";
      allowDiscards = true;
    };
    secrets = {
      "keyfile0.bin" = "/etc/secrets/initrd/keyfile0.bin";
    };
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/d3ecbcd2-a11f-4330-b812-b95edcffc03c";
    fsType = "btrfs";
    options = ["subvol=nix-stor"];
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/BD0C-B202";
    fsType = "vfat";
  };
  # my filesystems
  fileSystems."/windows" = {
    device = "/dev/disk/by-uuid/5CA8E333A8E309FA";
    fsType = "ntfs";
  };
  fileSystems."/home/ai3wm" = {
    device = "/dev/disk/by-uuid/d3ecbcd2-a11f-4330-b812-b95edcffc03c";
    fsType = "btrfs";
    options = ["subvol=home"];
  };
  swapDevices = [];
  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.acpilight.enable = true;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
