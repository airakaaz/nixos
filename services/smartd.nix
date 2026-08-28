{
  services.smartd = {
    enable = true;
    autodetect = false;

    defaults.monitored = "-a -o on -s (S/../.././02|L/../../7/04)";

    devices = [
      {
        device = "/dev/nvme0";
      }
      {
        device = "/dev/sda";
        options = "-d sat";
      }
    ];

    notifications.systembus-notify.enable = true;
  };
}
