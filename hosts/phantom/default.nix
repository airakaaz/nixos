{
  imports = [
    ./hardware-configuration.nix
    ../../modules/graphical/desktop.nix

    # hardware
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
    ../../modules/services/monitoring/prometheus-slave.nix
    ../../modules/services/monitoring/loki.nix
    ../../modules/services/monitoring/alloy.nix
    ../../modules/services/monitoring/glances.nix

    # applications
    ../../modules/services/applications/tph.nix

    # backup
    ./backup.nix
  ];
}
