{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.suites.music;
in {
  options.x-next.suites.music = with types; {
    enable = mkBoolOpt false "Whether or not to enable music configuration.";
  };

  config = mkIf cfg.enable {
    x-next = {
      apps = {
        ardour = enabled;
        bottles = enabled;
      };
    };
  };
}
