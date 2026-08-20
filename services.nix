{
  imports = [
    # connection
    ./services/openssh.nix
    ./services/tailscale.nix
    ./services/caddy.nix
    ./services/cloudflare-ddns.nix

    # monitoring
    ./services/cockpit.nix
    ./services/uptime-kuma.nix
    ./services/prometheus.nix
    ./services/grafana.nix

    # services
    ./services/adguardhome.nix
    ./services/immich.nix
    ./services/jellyfin.nix
    ./services/n8n.nix
    ./services/qbittorrent.nix
    ./services/llama-cpp.nix
    ./services/vaultwarden.nix

    # backup
    ./services/restic.nix

    # local
    ./services/keyd.nix
    ./services/logind.nix
  ];
}
