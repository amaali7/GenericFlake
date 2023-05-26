{
  lib,
  pkgs,
  config,
  ...
}: let
  cfg = config.x-next.apps.steamtinkerlaunch;

  inherit (lib) mkIf mkEnableOption;
in {
  options.x-next.apps.steamtinkerlaunch = {
    enable = mkEnableOption "Steam Tinker Launch";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      steamtinkerlaunch
    ];
  };
}
