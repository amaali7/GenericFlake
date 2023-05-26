{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.nix;
in {
  options.x-next.nix = with types; {
    enable = mkBoolOpt true "Whether or not to manage nix configuration.";
    package = mkOpt package pkgs.nixUnstable "Which nix package to use.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      x-next.nixos-revision
      deploy-rs
      nixfmt
      nix-index
      nix-prefetch-git
    ];

    nix = let
      users = ["root" config.x-next.user.name];
    in {
      package = cfg.package;

      settings =
        {
          experimental-features = "nix-command flakes";
          http-connections = 50;
          warn-dirty = false;
          log-lines = 50;
          sandbox = "relaxed";
          auto-optimise-store = true;
          trusted-users = users;
          allowed-users = users;
        }
        // (lib.optionalAttrs config.x-next.tools.direnv.enable {
          keep-outputs = true;
          keep-derivations = true;
        });

      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };

      # flake-utils-plus
      generateRegistryFromInputs = true;
      generateNixPathFromInputs = true;
      linkInputs = true;
    };
  };
}
