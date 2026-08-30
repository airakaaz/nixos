{
  imports = [
    ./hardware-configuration.nix

    # monitoring
    ../../services/uptime-kuma.nix
    ../../services/prometheus-exporter.nix
    ../../services/prometheus-scraper.nix
    ../../services/grafana.nix

    # services
    ../../services/adguardhome.nix
    ../../services/aira.kaaz.nix
    ../../services/cloudflare-ddns.nix
    ../../services/vaultwarden.nix
  ];
}
