{pkgs, ...}: {
  imports = [./hardware.nix ./boot.nix ./environment.nix ./networking.nix];
  system.stateVersion = "23.05";
}
