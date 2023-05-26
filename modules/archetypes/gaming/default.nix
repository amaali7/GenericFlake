{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.archetypes.gaming;
in {
  options.x-next.archetypes.gaming = with types; {
    enable = mkBoolOpt false "Whether or not to enable the gaming archetype.";
  };

  config = mkIf cfg.enable {
    x-next.suites = {
      common = enabled;
      desktop = enabled;
      games = enabled;
      social = enabled;
      media = enabled;
    };
  };
}
