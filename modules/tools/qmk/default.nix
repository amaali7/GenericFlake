{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.tools.qmk;
in {
  options.x-next.tools.qmk = with types; {
    enable = mkBoolOpt false "Whether or not to enable QMK";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      qmk
    ];

    services.udev.packages = with pkgs; [
      qmk-udev-rules
    ];
  };
}
