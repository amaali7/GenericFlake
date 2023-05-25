{
  options,
  lib,
  config,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.nix-next.groups.base;
in {
  options.nix-next.groups.base = with typs; {
    enable = mkBoolOpt false "whether or not enable Base group";
  };
  config = mkIf cfg.enable {
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
      font = "Lat2-Terminus16";
      keyMap = "us";
      useXkbConfig = true; # use xkbOptions in tty.
    };
    nix-next = {
      groups = {
        utils = {
          enable = true;
          tui = enabled;
        };
      };
    };
    # environment.systemPackages = with pkgs.nix-next; [libcrypt];
  };
}
