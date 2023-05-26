{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.apps.twitter;
in {
  options.x-next.apps.twitter = with types; {
    enable = mkBoolOpt false "Whether or not to enable Twitter.";
  };

  config =
    mkIf cfg.enable {environment.systemPackages = with pkgs.x-next; [twitter];};
}
