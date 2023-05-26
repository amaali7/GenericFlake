{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.apps.prismlauncher;
in {
  options.x-next.apps.prismlauncher = with types; {
    enable = mkBoolOpt false "Whether or not to enable Prism Launcher.";
  };

  config =
    mkIf cfg.enable {environment.systemPackages = with pkgs; [prismlauncher];};
}
