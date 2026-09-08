{
  imports = [
    ./hardware-configuration.nix

    # monitoring
    ../../modules/services/monitoring/uptime-kuma.nix
    ../../modules/services/monitoring/prometheus-exporter.nix
    ../../modules/services/monitoring/grafana.nix

    # networking
    ../../modules/networking/adguardhome.nix

    # applications
    ../../modules/services/applications/aira.nix
    ../../modules/services/applications/homepage.nix

    # infrastructure
    ../../modules/services/infra/cloudflare-ddns.nix

    # applications
    ../../modules/services/applications/vaultwarden.nix
    ../../modules/services/applications/stirling-pdf.nix

    # virtualisation
    ../../modules/virtualisation/docker.nix

    # backup
    ./backup.nix
  ];
}
