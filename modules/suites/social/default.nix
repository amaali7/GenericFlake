{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.suites.social;
in {
  options.x-next.suites.social = with types; {
    enable = mkBoolOpt false "Whether or not to enable social configuration.";
  };

  config = mkIf cfg.enable {
    x-next = {
      apps = {
        discord = {
          enable = true;
          chromium = enabled;
        };
        element = enabled;
      };
    };
  };
}
