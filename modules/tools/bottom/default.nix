{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.tools.bottom;
in {
  options.x-next.tools.bottom = with types; {
    enable = mkBoolOpt false "Whether or not to enable Bottom.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      bottom
    ];
  };
}
