{
  options,
  lib,
  config,
  pkgs,
  ...
}:
with lib;
with lib.internal; let
  cfg = config.nix-next.archtyps.rasp3;
in {
  options.nix-next.archtyps.rasp3 = with typs; {
    enable = mkBoolOpt false "whether or not enable Utils group";
  };
  config = mkIf cfg.enable {
    # Use the extlinux boot loader. (NixOS wants to enable GRUB by default)
    boot.loader.grub.enable = false;
    # Enables the generation of /boot/extlinux/extlinux.conf
    boot.loader.generic-extlinux-compatible.enable = true;
    nix-next = {
      groups = {
        base = enabled;
      };
    };

    users = {
      users = {
        root = {
          openssh = {
            authorizedKeys = {
              keys = [
                "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyiqfFYOd1Rqip/g9SfbmkI8Qbl43udMIu+43yJEOgYZ4VMcoJ6xx6d6KJdW7HVjnGGzs4xtpTniXZZ3jMhToxoQXgs9FyylV3fNuiibi1GcGg3yWT6PvU4DVznlP7OZoS8++V+vH9JNDAsZRXwgWrOnauE/L8V/UDJlvNZZA7FAN0GmDd50kiuD28+HDOwaxjJXFBjWhSpCXXTQ3l3IiTlslFYAkJaq0sStbRMHmYJM2aIFIBlHJkwxgSCslx8X00i2nCfgzRjJTBYn2HUuEaNHhOdyqHKBkcvxYZlT4Hw7N0nUlJ41kCdOBJkM/5PLCgFp5Z2DtFET3Eqo2gKUzOz9zFs8yqlB1le7Md9O4bX6cMKQTkSENirMxwkudu9CzdROGrjbXGR9V8QcMDoZVRMZD5SN8GHA0IcifnAcFha2Xzaqq0tCWuryA8CXlRskPHHy7hmpajpCwT+BOBZRnpllt2+9t53gIoyHfpSTgeJ9mZwQJ3pipc8t+NN3oQtEE= amaali1991@gmail.com"
              ];
            };
          };
          password = "root";
        };
        pi = {
          isNormalUser = true;
          extraGroups = ["wheel"];
          openssh = {
            authorizedKeys = {
              keys = [
                "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyiqfFYOd1Rqip/g9SfbmkI8Qbl43udMIu+43yJEOgYZ4VMcoJ6xx6d6KJdW7HVjnGGzs4xtpTniXZZ3jMhToxoQXgs9FyylV3fNuiibi1GcGg3yWT6PvU4DVznlP7OZoS8++V+vH9JNDAsZRXwgWrOnauE/L8V/UDJlvNZZA7FAN0GmDd50kiuD28+HDOwaxjJXFBjWhSpCXXTQ3l3IiTlslFYAkJaq0sStbRMHmYJM2aIFIBlHJkwxgSCslx8X00i2nCfgzRjJTBYn2HUuEaNHhOdyqHKBkcvxYZlT4Hw7N0nUlJ41kCdOBJkM/5PLCgFp5Z2DtFET3Eqo2gKUzOz9zFs8yqlB1le7Md9O4bX6cMKQTkSENirMxwkudu9CzdROGrjbXGR9V8QcMDoZVRMZD5SN8GHA0IcifnAcFha2Xzaqq0tCWuryA8CXlRskPHHy7hmpajpCwT+BOBZRnpllt2+9t53gIoyHfpSTgeJ9mZwQJ3pipc8t+NN3oQtEE= amaali1991@gmail.com"
              ];
            };
          };
          password = "pi";
        };
      };
    };

    documentation = {
      enable = false;
    };
    hardware = {
      enableRedistributableFirmware = {
        _type = "override";
        content = false;
        priority = 50;
      };
      firmware = [
        pkgs.raspberrypiWirelessFirmware
      ];
    };
    networking = {
      dhcpcd = enabled;
      wireless = enabled;
    };
    networking = {
      networkmanager = {
        enable = false;
      };
    };
    services = {
      openssh = {
        enable = true;
        openFirewall = true;
      };
      sshd = {
        enable = true;
      };
    };
    environment.systemPackages = with pkgs.nix-next;
    with pkgs; [
      wget
    ];
  };
}
