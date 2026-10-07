{
  imports = [
    ./hardware-configuration.nix

    # hardware
    ./hardware/drives.nix
    ./hardware/nvidia.nix
    ./hardware/keyd.nix
    ./hardware/logind.nix
    ./hardware/smartd.nix

    # virtualisation
    ../../modules/virtualisation/docker.nix
    ../../modules/virtualisation/libvirt.nix
    ../../modules/virtualisation/ad-lab.nix

    # monitoring
    ../../modules/services/monitoring/uptime-kuma.nix
    ../../modules/services/monitoring/grafana.nix
    ../../modules/services/monitoring/prometheus-master.nix
    ../../modules/services/monitoring/loki.nix
    ../../modules/services/monitoring/alloy.nix
    ../../modules/services/monitoring/glances.nix

    # applications
    ../../modules/services/applications/vaultwarden.nix
    ../../modules/services/applications/stirling-pdf.nix
    ../../modules/services/applications/affine.nix
    ../../modules/services/applications/aira.nix
    ../../modules/services/applications/homepage.nix

    # networking
    ../../modules/networking/adguardhome.nix

    # media
    ../../modules/services/media/immich.nix
    ../../modules/services/media/jellyfin.nix
    ../../modules/services/media/qbittorrent.nix

    # infra
    ../../modules/services/infra/cloudflare-ddns.nix

    # backup
    ./backup.nix
  ];
}
