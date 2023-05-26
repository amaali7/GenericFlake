{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.suites.art;
in {
  options.x-next.suites.art = with types; {
    enable = mkBoolOpt false "Whether or not to enable art configuration.";
  };

  config = mkIf cfg.enable {
    x-next = {
      apps = {
        gimp = enabled;
        inkscape = enabled;
        blender = enabled;
      };
    };
  };
}
