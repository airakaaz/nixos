{
  services.prometheus = {
    exporters = {
      node = {
        enable = true;
        listenAddress = "";
        port = 9099;
        enabledCollectors = [
          "systemd"
          "processes"
        ];
      };
    };
  };
}
