{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.tools.appimage-run;
in {
  options.x-next.tools.appimage-run = with types; {
    enable = mkBoolOpt false "Whether or not to enable appimage-run.";
  };

  config = mkIf cfg.enable {
    x-next.home.configFile."wgetrc".text = "";

    environment.systemPackages = with pkgs; [
      appimage-run
    ];
  };
}
