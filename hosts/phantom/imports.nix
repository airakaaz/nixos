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
    ../../services/prometheus-exporter.nix

    # services
    ../../services/adguardhome.nix
    ../../services/immich.nix
    ../../services/jellyfin.nix
    ../../services/qbittorrent.nix
    ../../services/cloudflare-ddns.nix
    ../../services/smartd.nix

    # backup
    ../../services/restic.nix

    # local
    ../../services/keyd.nix
    ../../services/logind.nix
  ];
}
