inputs @ {
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.cli-apps.neovim;
in {
  options.x-next.cli-apps.neovim = with types; {
    enable = mkBoolOpt false "Whether or not to enable neovim.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      # @FIXME(jakehamilton): As of today (2022-12-09), `page` no longer works with my Neovim
      # configuration. Either something in my configuration is breaking it or `page` is busted.
      # page
      # x-next.neovim
      neovim
    ];

    environment.variables = {
      # PAGER = "page";
      # MANPAGER =
      #   "page -C -e 'au User PageDisconnect sleep 100m|%y p|enew! |bd! #|pu p|set ft=man'";
      PAGER = "less";
      MANPAGER = "less";
      NPM_CONFIG_PREFIX = "$HOME/.npm-global";
      EDITOR = "nvim";
    };

    x-next.home = {
      configFile = {
        "dashboard-nvim/.keep".text = "";
      };

      extraOptions = {
        # Use Neovim for Git diffs.
        programs.zsh.shellAliases.vimdiff = "nvim -d";
        programs.bash.shellAliases.vimdiff = "nvim -d";
        programs.fish.shellAliases.vimdiff = "nvim -d";
      };
    };
  };
}
