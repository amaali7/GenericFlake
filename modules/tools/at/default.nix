{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.tools.at;
in {
  options.x-next.tools.at = with types; {
    enable = mkBoolOpt false "Whether or not to install at.";
    pkg = mkOpt package pkgs.x-next.at "The package to install as at.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      cfg.pkg
    ];
  };
}
