{
  services.qbittorrent = {
    # passowrd setup: check journald logs for the 1st time
    enable = true;
    webuiPort = 8070;
  };

  services.tailscale.serve.services.torrent = {
    endpoints = {
      "tcp:80" = "http://localhost:8070";
    };
    advertised = true;
  };
}
