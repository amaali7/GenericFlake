{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.apps.winetricks;
in {
  options.x-next.apps.winetricks = with types; {
    enable = mkBoolOpt false "Whether or not to enable Winetricks.";
  };

  config =
    mkIf cfg.enable {environment.systemPackages = with pkgs; [winetricks];};
}
