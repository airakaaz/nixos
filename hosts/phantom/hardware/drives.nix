{ ... }:

{
  fileSystems."/media/storage" = {
    device = "/dev/disk/by-uuid/F2BE3F38BE3EF4A7";
    fsType = "ntfs";
    options = [
      "nofail"
      "x-systemd.automount"
      "x-systemd.device-timeout=5s"
      "x-systemd.idle-timeout=60"
    ];
  };
}
