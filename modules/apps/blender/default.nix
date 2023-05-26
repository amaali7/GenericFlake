{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.apps.blender;
in {
  options.x-next.apps.blender = with types; {
    enable = mkBoolOpt false "Whether or not to enable Blender.";
  };

  config =
    mkIf cfg.enable {environment.systemPackages = with pkgs; [blender];};
}
