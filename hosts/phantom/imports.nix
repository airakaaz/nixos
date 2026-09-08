{
  imports = [
    ./hardware-configuration.nix

    # extra hardware
    ../../drives.nix
    ../../nvidia.nix

    # virtualization
    ../../virtualization/docker.nix
    ../../virtualization/libvirt.nix
    ../../virtualization/lab.nix

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
    ./backup.nix

    # local
    ../../services/keyd.nix
    ../../services/logind.nix
  ];
}
