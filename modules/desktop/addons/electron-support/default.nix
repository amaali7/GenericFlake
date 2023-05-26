{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.desktop.addons.electron-support;
in {
  options.x-next.desktop.addons.electron-support = with types; {
    enable =
      mkBoolOpt false
      "Whether to enable electron support in the desktop environment.";
  };

  config = mkIf cfg.enable {
    x-next.home.configFile."electron-flags.conf".source =
      ./electron-flags.conf;

    environment.sessionVariables = {NIXOS_OZONE_WL = "1";};
  };
}
