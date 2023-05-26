{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.desktop.addons.swappy;
in {
  options.x-next.desktop.addons.swappy = with types; {
    enable =
      mkBoolOpt false "Whether to enable Swappy in the desktop environment.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [swappy];

    x-next.home.configFile."swappy/config".source = ./config;
    x-next.home.file."Pictures/screenshots/.keep".text = "";
  };
}
