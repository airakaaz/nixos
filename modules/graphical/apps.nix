{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox
    floorp-bin
    kitty
    affine
    dbeaver-bin
    ghidra
    virt-viewer
    virt-manager
    helvum
    vesktop
  ];

  programs.wireshark.enable = true;
}
