{
  options,
  lib,
  config,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.nix-next.groups.utils.tui;
in {
  options.nix-next.groups.utils.tui = with typs; {
    enable = mkBoolOpt false "whether or not enable Tui group";
  };
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs.nix-next;
    with pkgs; [
      gtypist
      cava
      ntfs3g
      dex
      minicom
      zstd
      unzip
      starship
      macchina
      sptlrx
      macchanger
      iw
      wget
      terminal-colors
      ttyper
      openssl_1_1
      starship
    ];
  };
}
