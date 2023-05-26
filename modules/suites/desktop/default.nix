{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.suites.desktop;
in {
  options.x-next.suites.desktop = with types; {
    enable =
      mkBoolOpt false "Whether or not to enable common desktop configuration.";
  };

  config = mkIf cfg.enable {
    x-next = {
      desktop = {
        gnome = enabled;

        addons = {wallpapers = enabled;};
      };

      apps = {
        _1password = enabled;
        firefox = enabled;
        vlc = enabled;
        logseq = enabled;
        hey = enabled;
        pocketcasts = enabled;
        yt-music = enabled;
        twitter = enabled;
        gparted = enabled;
      };
    };
  };
}
