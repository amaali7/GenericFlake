{
  options,
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.desktop.addons.wallpapers;
  inherit (pkgs.x-next) wallpapers;
in {
  options.x-next.desktop.addons.wallpapers = with types; {
    enable =
      mkBoolOpt false
      "Whether or not to add wallpapers to ~/Pictures/wallpapers.";
  };

  config = {
    x-next.home.file =
      lib.foldl
      (acc: name: let
        wallpaper = wallpapers.${name};
      in
        acc
        // {
          "Pictures/wallpapers/${wallpaper.fileName}".source = wallpaper;
        })
      {}
      (wallpapers.names);
  };
}
