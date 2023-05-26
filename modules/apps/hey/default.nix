{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.apps.hey;
in {
  options.x-next.apps.hey = with types; {
    enable = mkBoolOpt false "Whether or not to enable HEY.";
  };

  config = mkIf cfg.enable {environment.systemPackages = with pkgs.x-next; [hey];};
}
