{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.suites.media;
in {
  options.x-next.suites.media = with types; {
    enable = mkBoolOpt false "Whether or not to enable media configuration.";
  };

  config = mkIf cfg.enable {x-next = {apps = {freetube = enabled;};};};
}
