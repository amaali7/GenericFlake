{
  pkgs,
  lib,
  nixos-hardware,
  ...
}:
with lib;
with lib.internal; {
  imports = [./hardware.nix];
  boot.loader.grub = enabled;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";
  x-next = {
    archetypes = {
      workstation = enabled;
    };

    # apps = {
    #   steam = enabled;
    # };

    # system = {
    #   zfs = enabled;
    # };
  };

  x-next.home.extraOptions = {
    dconf.settings = {
      "org/gnome/shell/extensions/just-perfection" = {
        panel-size = 60;
      };
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
