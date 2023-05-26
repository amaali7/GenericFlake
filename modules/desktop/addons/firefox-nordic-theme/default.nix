{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.desktop.addons.firefox-nordic-theme;
  profileDir = ".mozilla/firefox/${config.x-next.user.name}";
in {
  options.x-next.desktop.addons.firefox-nordic-theme = with types; {
    enable = mkBoolOpt false "Whether to enable the Nordic theme for firefox.";
  };

  config = mkIf cfg.enable {
    x-next.apps.firefox = {
      extraConfig =
        builtins.readFile
        "${pkgs.x-next.firefox-nordic-theme}/configuration/user.js";
      userChrome = ''
        @import "${pkgs.x-next.firefox-nordic-theme}/userChrome.css";
      '';
    };
  };
}
