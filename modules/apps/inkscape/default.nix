{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.apps.inkscape;
in {
  options.x-next.apps.inkscape = with types; {
    enable = mkBoolOpt false "Whether or not to enable Inkscape.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [inkscape-with-extensions google-fonts];
  };
}
