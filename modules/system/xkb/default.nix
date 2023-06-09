{
  options,
  config,
  lib,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.system.xkb;
in {
  options.x-next.system.xkb = with types; {
    enable = mkBoolOpt false "Whether or not to configure xkb.";
  };

  config = mkIf cfg.enable {
    console.useXkbConfig = true;
    services.xserver = {
      layout = "us";
      xkbOptions = "caps:escape";
    };
  };
}
