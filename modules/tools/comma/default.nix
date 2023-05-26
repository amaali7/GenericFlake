{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.tools.comma;
in {
  options.x-next.tools.comma = with types; {
    enable = mkBoolOpt false "Whether or not to enable comma.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      comma
      x-next.nix-update-index
    ];

    x-next.home.extraOptions = {programs.nix-index.enable = true;};
  };
}
