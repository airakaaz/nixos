{
  services.qbittorrent = {
    # passowrd setup: check journald logs for the 1st time
    enable = true;
    webuiPort = 8070;
    serverConfig = {
      Preferences = {
        WebUI = {
          CSRFProtection = false;
          HostHeaderValidation = false;
        };
      };
    };
  };

  services.caddy.virtualHosts."qbt.kaaz.top".extraConfig = ''
    tls internal
    reverse_proxy localhost:8070
  '';
}
