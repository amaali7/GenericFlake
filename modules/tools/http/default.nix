{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.tools.http;
in {
  options.x-next.tools.http = with types; {
    enable = mkBoolOpt false "Whether or not to enable common http utilities.";
  };

  config =
    mkIf cfg.enable {environment.systemPackages = with pkgs; [wget curl];};
}
