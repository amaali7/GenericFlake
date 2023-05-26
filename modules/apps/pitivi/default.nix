{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.apps.pitivi;
in {
  options.x-next.apps.pitivi = with types; {
    enable = mkBoolOpt false "Whether or not to enable Pitivi.";
  };

  config =
    mkIf cfg.enable {environment.systemPackages = with pkgs; [pitivi];};
}
