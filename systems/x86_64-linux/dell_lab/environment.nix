{
  config,
  pkgs,
  ...
}: {
  environment.pathsToLink = ["/libexec" "/share/nix-direnv"];
  environment.variables.C_INCLUDE_PATH = "${with pkgs; libcrypt.dev}/include";
  environment.variables = {
    QT_QPA_PLATFORM_PLUGIN_PATH = "${pkgs.qt5.qtbase.bin.outPath}/lib/qt-${pkgs.qt5.qtbase.version}/plugins";
  };

  # nix options for derivations to persist garbage collection
  nix.settings = {
    keep-outputs = true;
    keep-derivations = true;
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };
  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
    };
  };

  # virtual networking lab
  time.timeZone = "Africa/Cairo";
  i18n.defaultLocale = "en_US.utf8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ar_EG.utf8";
    LC_IDENTIFICATION = "ar_EG.utf8";
    LC_MEASUREMENT = "ar_EG.utf8";
    LC_MONETARY = "ar_EG.utf8";
    LC_NAME = "ar_EG.utf8";
    LC_NUMERIC = "ar_EG.utf8";
    LC_PAPER = "ar_EG.utf8";
    LC_TELEPHONE = "ar_EG.utf8";
    LC_TIME = "ar_EG.utf8";
  };
  fonts.fontDir.enable = true;
  sound.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
}
