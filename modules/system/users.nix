{ pkgs, ... }:

{
  users.users."kaz" = {
    isNormalUser = true;
    createHome = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "jellyfin"
      "libvirtd"
      "kvm"
      "wireshark"
    ];
    shell = pkgs.fish;
    linger = true;
  };
}
