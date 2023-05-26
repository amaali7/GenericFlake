{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.apps.pocketcasts;
in {
  options.x-next.apps.pocketcasts = with types; {
    enable = mkBoolOpt false "Whether or not to enable Pocketcasts.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs.x-next; [pocketcasts];
  };
}
