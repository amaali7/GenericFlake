{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.apps.yt-music;
in {
  options.x-next.apps.yt-music = with types; {
    enable = mkBoolOpt false "Whether or not to enable YouTube Music.";
  };

  config =
    mkIf cfg.enable {environment.systemPackages = with pkgs.x-next; [yt-music];};
}
