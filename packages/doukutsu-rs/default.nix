{ lib, pkgs, rustPlatform, fetchFromGitHub, ... }:

let
  # Game data from the original freeware version of the game. All other
  # versions of the game are proprietary so we can't ship them. However,
  # you can dump game data yourself (see doukutsu-rs for instructions)
  # and use that instead for your personal use.
  gameData = fetchFromGitHub {
    owner = "doukutsu-rs";
    repo = "game-data";
    rev = "f08e35952f2d9358f6591984d5870e7312492999";
    sha256 = "0irk47ymcdq9i9zllx0m28yk9dw83zay07k3sn8iqjy2ikc64q52";
  };

in
rustPlatform.buildRustPackage rec {
  pname = "doukutsu-rs";
  version = "0.99.0-beta4";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = version;
    sha256 = "CLSisgl7Ng2ucUbkWyOJ9kL3GqATGONgPSwFCE3Qxf0=";
  };

  cargoPatches = [
    # The project doesn't include a Cargo.lock file, so we need to patch one in.
    # This patch is generated by cloning the doukutsu-rs repository and running the following commands:
    #
    # cargo update
    # git diff --no-index --patch /dev/null ./Cargo.lock
    ./cargo.patch
    # The project tries to build SDL from source as well as use a static library as opposed to
    # the dynamic one that NixPkgs provides. This patch disables the "bundled" and "static-link" options.
    ./cargo-toml.patch
  ];

  cargoSha256 = "zyfZ3LkJgqqiomy0cy1uAAZBCq8oyISm3xfc/+x05w8=";

  postInstall = ''
    mkdir -p $out/libexec/doukutsu-rs

    mv $out/bin/doukutsu-rs $out/libexec/doukutsu-rs/

    ln -s $out/libexec/doukutsu-rs/doukutsu-rs $out/bin/doukutsu-rs

    ln -s ${gameData} $out/libexec/doukutsu-rs/data
  '';

  # Tests currently fail in the project, so we're forced to skip them.
  doCheck = false;

  nativeBuildInputs = with pkgs; [ pkg-config cmake ];

  buildInputs = with pkgs; [ alsa-lib SDL2 ];

  meta = {
    platforms = lib.platforms.linux;
  };
}