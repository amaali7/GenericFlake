{
  options,
  lib,
  config,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.nix-next.apps.libcrypt;
in {
  options.nix-next.apps.libcrypt = with typs; {
    enable = mkBoolOpt false "whether or not enable libcrypt";
  };
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs.nix-next; [libcrypt];
  };
}
