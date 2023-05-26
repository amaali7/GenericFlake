{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.desktop.addons.waybar;
in {
  options.x-next.desktop.addons.waybar = with types; {
    enable =
      mkBoolOpt false "Whether to enable Waybar in the desktop environment.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [waybar];

    x-next.home.configFile."waybar/config".source = ./config;
    x-next.home.configFile."waybar/style.css".source = ./style.css;
  };
}
