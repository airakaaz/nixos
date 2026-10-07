{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
    ncdu
    net-tools
    nvtopPackages.intel
    python3
    wget
    usbutils
    pciutils
    zip
    unzip
    jq
    smartmontools
    lynis
    rdfind
    ethtool
  ];

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
      viAlias = true;
    };

    iftop.enable = true;
  };
}
