{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.apps.virtualbox;
in {
  options.x-next.apps.virtualbox = with types; {
    enable = mkBoolOpt false "Whether or not to enable Virtualbox.";
  };

  config = mkIf cfg.enable {
    virtualisation.virtualbox.host = {
      enable = true;
      enableExtensionPack = true;
    };

    x-next.user.extraGroups = ["vboxusers"];
  };
}
