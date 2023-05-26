{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.services.printing;
in {
  options.x-next.services.printing = with types; {
    enable = mkBoolOpt false "Whether or not to configure printing support.";
  };

  config = mkIf cfg.enable {services.printing.enable = true;};
}
