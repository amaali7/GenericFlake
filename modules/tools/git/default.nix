{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.tools.git;
  gpg = config.x-next.security.gpg;
  user = config.x-next.user;
in {
  options.x-next.tools.git = with types; {
    enable = mkBoolOpt false "Whether or not to install and configure git.";
    userName = mkOpt types.str user.fullName "The name to configure git with.";
    userEmail = mkOpt types.str user.email "The email to configure git with.";
    signingKey =
      mkOpt types.str "9762169A1B35EA68" "The key ID to sign commits with.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [git];

    x-next.home.extraOptions = {
      programs.git = {
        enable = true;
        inherit (cfg) userName userEmail;
        lfs = enabled;
        signing = {
          key = cfg.signingKey;
          signByDefault = mkIf gpg.enable true;
        };
        extraConfig = {
          init = {defaultBranch = "main";};
          pull = {rebase = true;};
          push = {autoSetupRemote = true;};
          core = {whitespace = "trailing-space,space-before-tab";};
          safe = {
            directory = "${config.users.users.${user.name}.home}/work/config";
          };
        };
      };
    };
  };
}
