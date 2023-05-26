{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.desktop.addons.rofi;
in {
  options.x-next.desktop.addons.rofi = with types; {
    enable =
      mkBoolOpt false "Whether to enable Rofi in the desktop environment.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [rofi];

    x-next.home.configFile."rofi/config.rasi".source = ./config.rasi;
  };
}
