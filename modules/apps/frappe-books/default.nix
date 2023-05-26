{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.x-next.apps.frappe-books;
in {
  options.x-next.apps.frappe-books = with types; {
    enable = mkBoolOpt false "Whether or not to enable FrappeBooks.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [x-next.frappe-books];
  };
}
