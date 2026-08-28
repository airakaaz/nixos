{
  imports = [
    ./hardware-configuration.nix

    # extra hardware
    ../../drives.nix
    ../../nvidia.nix

    # other
    ../../virt.nix
    ../../lab.nix

    # monitoring
    ../../services/uptime-kuma.nix
    ../../services/prometheus-exporter.nix
    # ../../services/prometheus-scraper.nix
    # ../../services/grafana.nix

    # services
    ../../services/adguardhome.nix
    # ../../services/aira.kaaz.nix
    ../../services/immich.nix
    ../../services/jellyfin.nix
    ../../services/qbittorrent.nix
    ../../services/vaultwarden.nix
    ../../services/cloudflare-ddns.nix
    ../../services/smartd.nix
    # ../../services/n8n.nix
    # ../../services/llama-cpp.nix

    # backup
    ../../services/restic.nix

    # local
    ../../services/keyd.nix
    ../../services/logind.nix
  ];
}
