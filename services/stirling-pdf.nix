{
  services.stirling-pdf = {
    enable = true;
    environment = {
      SERVER_ADDRESS = "127.0.0.1";
      SERVER_PORT = 8081;
    };
  };

  services.caddy.virtualHosts."pdf.kaaz.top".extraConfig = ''
    reverse_proxy localhost:8081
  '';

  services.cloudflare-ddns.ip4Domains = [ "pdf.kaaz.top" ];

  services.fail2ban.jails."stirling-pdf" = {
    filter = {
      Definition = {
        failregex = ".*AuthController - Invalid password for user: .* from IP: <HOST>.*";
        journalmatch = "_SYSTEMD_UNIT=stirling-pdf.service";
      };
    };
    settings = {
      findtime = 15 * 60;
      maxretry = 5;
      bantime = 1 * 60 * 60;
    };
  };
}
