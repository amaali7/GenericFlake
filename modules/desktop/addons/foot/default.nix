{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.desktop.addons.foot;
in {
  options.x-next.desktop.addons.foot = with types; {
    enable = mkBoolOpt false "Whether to enable the gnome file manager.";
  };

  config = mkIf cfg.enable {
    x-next.desktop.addons.term = {
      enable = true;
      pkg = pkgs.foot;
    };

    x-next.home.configFile."foot/foot.ini".source = ./foot.ini;
  };
}
