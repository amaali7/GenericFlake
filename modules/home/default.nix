{
  options,
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.home;
in {
  imports = with inputs; [
    home-manager.nixosModules.home-manager
  ];

  options.x-next.home = with types; {
    file =
      mkOpt attrs {}
      "A set of files to be managed by home-manager's <option>home.file</option>.";
    configFile =
      mkOpt attrs {}
      "A set of files to be managed by home-manager's <option>xdg.configFile</option>.";
    extraOptions = mkOpt attrs {} "Options to pass directly to home-manager.";
  };

  config = {
    x-next.home.extraOptions = {
      home.stateVersion = config.system.stateVersion;
      home.file = mkAliasDefinitions options.x-next.home.file;
      xdg.enable = true;
      xdg.configFile = mkAliasDefinitions options.x-next.home.configFile;
    };

    home-manager = {
      useUserPackages = true;

      users.${config.x-next.user.name} =
        mkAliasDefinitions options.x-next.home.extraOptions;
    };
  };
}
