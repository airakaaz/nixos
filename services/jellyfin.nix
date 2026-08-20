{
  services.jellyfin = {
    enable = true;
    hardwareAcceleration = {
      enable = true;
      device = "/dev/dri/renderD129";
    };
  };

  services.tailscale.serve.services.jellyfin = {
    endpoints = {
      "tcp:80" = "http://localhost:8096";
    };
    advertised = true;
  };

  services.caddy.virtualHosts."watch.kaaz.top".extraConfig = ''
    reverse_proxy localhost:8096
  '';

  services.cloudflare-ddns.ip4Domains = [ "watch.kaaz.top" ];
}
