{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.x-next.tools.icehouse;

  inherit (lib) mkEnableOption mkIf;
in {
  options.x-next.tools.icehouse = {
    enable = mkEnableOption "Icehouse";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [pkgs.snowfallorg.icehouse];
  };
}
