{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.apps.ubports-installer;
in {
  options.x-next.apps.ubports-installer = with types; {
    enable = mkBoolOpt false "Whether or not to enable the UBPorts Installer.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs.x-next; [
      ubports-installer
    ];

    services.udev.packages = with pkgs.x-next; [
      ubports-installer-udev-rules
    ];
  };
}
