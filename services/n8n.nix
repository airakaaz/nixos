{
  services.n8n = {
    enable = true;
    environment = {
      N8N_LISTEN_ADDRESS = "127.0.0.1";
      N8N_PORT = "5678";

      N8N_PROTOCOL = "http";
      N8N_SECURE_COOKIE = false;
    };
    openFirewall = false;
  };

  services.caddy.virtualHosts."n8n.kaaz.top".extraConfig = ''
    tls internal
    reverse_proxy localhost:5678
  '';
}
