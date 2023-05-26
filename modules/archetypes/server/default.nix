{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.archetypes.server;
in {
  options.x-next.archetypes.server = with types; {
    enable =
      mkBoolOpt false "Whether or not to enable the server archetype.";
  };

  config = mkIf cfg.enable {
    x-next = {
      suites = {
        common-slim = enabled;
      };

      cli-apps = {
        neovim = enabled;
        tmux = enabled;
      };
    };
  };
}
