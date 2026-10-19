{ ... }:

{
  services = {
    displayManager.ly = {
      enable = true;
      settings.tty = 1;
    };

    desktopManager.gnome.enable = true;
    xserver.enable = true;
  };
}
