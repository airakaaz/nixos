{
  services.adguardhome = {
    enable = true;
    port = 3000;
  };

  services.caddy.virtualHosts."dns.kaaz.top".extraConfig = ''
    tls internal
    reverse_proxy localhost:3000
  '';
}
