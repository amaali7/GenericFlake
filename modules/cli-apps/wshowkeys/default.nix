{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.cli-apps.wshowkeys;
in {
  options.x-next.cli-apps.wshowkeys = with types; {
    enable = mkBoolOpt false "Whether or not to enable wshowkeys.";
  };

  config = mkIf cfg.enable {
    x-next.user.extraGroups = ["input"];
    environment.systemPackages = with pkgs; [wshowkeys];
  };
}
