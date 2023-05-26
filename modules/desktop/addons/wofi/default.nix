{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.desktop.addons.wofi;
in {
  options.x-next.desktop.addons.wofi = with types; {
    enable =
      mkBoolOpt false "Whether to enable the Wofi in the desktop environment.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [wofi wofi-emoji];

    # config -> .config/wofi/config
    # css -> .config/wofi/style.css
    # colors -> $XDG_CACHE_HOME/wal/colors
    # x-next.home.configFile."foot/foot.ini".source = ./foot.ini;
    x-next.home.configFile."wofi/config".source = ./config;
    x-next.home.configFile."wofi/style.css".source = ./style.css;
  };
}
