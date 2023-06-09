{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.apps.yuzu;
in {
  options.x-next.apps.yuzu = with types; {
    enable = mkBoolOpt false "Whether or not to enable Yuzu.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [yuzu-mainline];
  };
}
