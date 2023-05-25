{
  lib,
  inputs,
  snowfall-inputs,
}: let
  inherit (inputs.nixpkgs.lib) assertMsg last;
in {
  enabled = {
    enable = true;
  };
}
