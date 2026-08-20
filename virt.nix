{ pkgs, ... }:

{
  programs.virt-manager.enable = true;

  virtualisation = {
    spiceUSBRedirection.enable = true;

    libvirtd = {
      enable = true;
      dbus.enable = true;
      allowedBridges = [ "virbr1" ];

      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = false;
        swtpm.enable = true;
      };
    };
  };
}
