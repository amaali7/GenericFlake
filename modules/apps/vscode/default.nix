{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.apps.vscode;
in {
  options.x-next.apps.vscode = with types; {
    enable = mkBoolOpt false "Whether or not to enable vscode.";
  };

  config =
    mkIf cfg.enable {environment.systemPackages = with pkgs; [vscode];};
}
