{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.suites.games;
  apps = {
    steam = enabled;
    prismlauncher = enabled;
    lutris = enabled;
    winetricks = enabled;
    protontricks = enabled;
    doukutsu-rs = enabled;
    bottles = enabled;
  };
  cli-apps = {
    wine = enabled;
    proton = enabled;
  };
in {
  options.x-next.suites.games = with types; {
    enable =
      mkBoolOpt false "Whether or not to enable common games configuration.";
  };

  config = mkIf cfg.enable {x-next = {inherit apps cli-apps;};};
}
