{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.system.time;
in {
  options.x-next.system.time = with types; {
    enable =
      mkBoolOpt false "Whether or not to configure timezone information.";
  };

  config = mkIf cfg.enable {time.timeZone = "America/Los_Angeles";};
}
