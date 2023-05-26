{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.suites.business;
in {
  options.x-next.suites.business = with types; {
    enable = mkBoolOpt false "Whether or not to enable business configuration.";
  };

  config =
    mkIf cfg.enable {x-next = {apps = {frappe-books = enabled;};};};
}
