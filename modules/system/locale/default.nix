{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.system.locale;
in {
  options.x-next.system.locale = with types; {
    enable = mkBoolOpt false "Whether or not to manage locale settings.";
  };

  config = mkIf cfg.enable {
    i18n.defaultLocale = "en_US.UTF-8";

    console = {keyMap = mkForce "us";};
  };
}
