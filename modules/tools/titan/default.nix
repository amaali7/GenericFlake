{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.tools.titan;
in {
  options.x-next.tools.titan = with types; {
    enable = mkBoolOpt false "Whether or not to install Titan.";
    pkg = mkOpt package pkgs.x-next.titan "The package to install as Titan.";
  };

  config = mkIf cfg.enable {
    x-next.tools = {
      # Titan depends on Node and Git
      node = enabled;
      git = enabled;
    };

    environment.systemPackages = [
      cfg.pkg
    ];
  };
}
