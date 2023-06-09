{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.apps.pcsx2;
in {
  options.x-next.apps.pcsx2 = with types; {
    enable = mkBoolOpt false "Whether or not to enable PCSX2.";
  };

  config =
    mkIf cfg.enable {environment.systemPackages = with pkgs; [pcsx2];};
}
