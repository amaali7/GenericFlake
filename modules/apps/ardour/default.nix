{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.apps.ardour;
in {
  options.x-next.apps.ardour = with types; {
    enable = mkBoolOpt false "Whether or not to enable Ardour.";
  };

  config =
    mkIf cfg.enable {environment.systemPackages = with pkgs; [ardour];};
}
