{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.apps.cadence;
in {
  options.x-next.apps.cadence = with types; {
    enable = mkBoolOpt false "Whether or not to enable Cadence.";
  };

  config =
    mkIf cfg.enable {environment.systemPackages = with pkgs; [cadence];};
}
