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
