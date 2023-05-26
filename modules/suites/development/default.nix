{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.suites.development;
  apps = {
    vscode = enabled;
    yubikey = enabled;
  };
  cli-apps = {
    tmux = enabled;
    neovim = enabled;
    yubikey = enabled;
    prisma = enabled;
  };
in {
  options.x-next.suites.development = with types; {
    enable =
      mkBoolOpt false
      "Whether or not to enable common development configuration.";
  };

  config = mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = [
      12345
      3000
      3001
      8080
      8081
    ];

    x-next = {
      inherit apps cli-apps;

      tools = {
        at = enabled;
        direnv = enabled;
        go = enabled;
        http = enabled;
        k8s = enabled;
        node = enabled;
        titan = enabled;
        qmk = enabled;
      };

      virtualisation = {podman = enabled;};
    };
  };
}
