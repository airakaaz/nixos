{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    appimage-run
    firefox
    floorp-bin
    kitty
    affine
    dbeaver-bin
    virt-viewer
    virt-manager
    helvum
    vesktop
    wireshark
  ];

  # programs.kdeconnect.enable = true;
  programs.wireshark.enable = true;
  programs.ghidra.enable = true;
}
