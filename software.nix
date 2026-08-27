{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
    ncdu
    net-tools
    nvtopPackages.intel
    nvtopPackages.nvidia
    python3
    wget
    usbutils
    pciutils
    zip
    unzip
    jq
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
