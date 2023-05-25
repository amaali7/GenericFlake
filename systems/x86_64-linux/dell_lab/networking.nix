{
  config,
  lib,
  pkgs,
  ...
}: {
  networking.useDHCP = lib.mkDefault true;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  networking = {
    #      hostId = "dtt61";
    networkmanager.enableFccUnlock = true;
    hostName = "WhatEver";
    domain = "coffeeshop.com";
    dhcpcd.enable = false;
    networkmanager.enable = true;
    usePredictableInterfaceNames = false;
    #interfaces.enp0s31f6.ipv4.addresses = [{
    #  address = "192.168.1.2";
    #  prefixLength = 28;
    #}];
    # vlans = {
    #   vlan100 = { id=100; interface="eth0"; };
    #   vlan101 = { id=101; interface="eth0"; };
    # };
    # interfaces.vlan100.ipv4.addresses = [{
    #   address = "10.101.111.2";
    #   prefixLength = 24;
    # }];
    # interfaces.vlan101.ipv4.addresses = [{
    #   address = "10.101.19.3";
    #   prefixLength = 24;
    # }];
    # defaultGateway = "192.168.1.1";
    # nameservers = [ "1.1.1.1" "8.8.8.8" ];
  };
}
