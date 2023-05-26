{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.suites.emulation;
in {
  options.x-next.suites.emulation = with types; {
    enable =
      mkBoolOpt false "Whether or not to enable emulation configuration.";
  };

  config = mkIf cfg.enable {
    x-next = {
      apps = {
        yuzu = enabled;
        pcsx2 = enabled;
        dolphin = enabled;
      };
    };
  };
}
