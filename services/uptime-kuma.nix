{
  services.uptime-kuma = {
    enable = true;
    settings = {
      PORT = "3001";
      HOST = "localhost";
    };
  };

  services.caddy.virtualHosts."up.kaaz.top".extraConfig = ''
    tls internal
    reverse_proxy localhost:3001
  '';
}
