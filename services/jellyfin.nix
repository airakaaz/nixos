{
  services.jellyfin = {
    enable = true;
    hardwareAcceleration = {
      enable = true;
      device = "/dev/dri/renderD128";
    };
  };

  services.caddy.virtualHosts."watch.kaaz.top".extraConfig = ''
    reverse_proxy localhost:8096
  '';

  services.cloudflare-ddns.ip4Domains = [ "watch.kaaz.top" ];
}
