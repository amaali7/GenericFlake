{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.hardware.fingerprint;
in {
  options.x-next.hardware.fingerprint = with types; {
    enable = mkBoolOpt false "Whether or not to enable fingerprint support.";
  };

  config = mkIf cfg.enable {services.fprintd.enable = true;};
}
