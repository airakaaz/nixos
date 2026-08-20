{
  services.prometheus = {
    enable = true;
    # listenAddress = "localhost";
    port = 9090;

    exporters = {
      node = {
        enable = true;
        listenAddress = "";
        port = 9100;
        enabledCollectors = [
          "systemd"
          "processes"
        ];
      };
    };
  };
}
