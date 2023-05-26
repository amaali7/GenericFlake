{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.suites.video;
in {
  options.x-next.suites.video = with types; {
    enable = mkBoolOpt false "Whether or not to enable video configuration.";
  };

  config = mkIf cfg.enable {
    x-next = {
      apps = {
        pitivi = enabled;
        obs = enabled;
      };
    };
  };
}
