{
  services.qbittorrent = {
    # passowrd setup: check journald logs for the 1st time
    enable = true;
    webuiPort = 8070;
  };

  services.caddy.virtualHosts."qbt.kaaz.top".extraConfig = ''
    tls internal
    reverse_proxy localhost:8070
  '';
}
