{
  options,
  lib,
  config,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.nix-next.groups.utils;
in {
  options.nix-next.groups.utils = with typs; {
    enable = mkBoolOpt false "whether or not enable Utils group";
  };
  config = mkIf cfg.enable {
    # environment.systemPackages = with pkgs.nix-next; [libcrypt];
  };
}
