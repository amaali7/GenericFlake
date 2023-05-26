{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.security.keyring;
in {
  options.x-next.security.keyring = with types; {
    enable = mkBoolOpt false "Whether to enable gnome keyring.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      gnome.gnome-keyring
      gnome.libgnome-keyring
    ];
  };
}
