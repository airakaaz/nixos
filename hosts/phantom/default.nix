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
    ../../modules/services/monitoring/prometheus-exporter.nix

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
