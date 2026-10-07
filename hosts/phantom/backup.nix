{
  services.restic.backups.phantom = {
    initialize = true;
    inhibitsSleep = true;
    passwordFile = "/var/lib/secrets/restic/restic-passwd";
    repository = "/media/storage/phantom/restic/phantom";

    paths = [
      "/var/lib/AdGuardHome"
      "/var/lib/affine"
      "/var/lib/caddy"
      "/var/lib/grafana"
      "/var/lib/immich"
      "/var/lib/jellyfin"
      "/var/lib/postgresql"
      "/var/lib/private/uptime-kuma"
      "/var/lib/prometheus2"
      "/var/lib/qBittorrent"
      "/var/lib/redis-immich"
      "/var/lib/secrets"
      "/var/lib/stirling-pdf"
      "/var/lib/vaultwarden"
    ];

    extraBackupArgs = [
      "--exclude-caches"
    ];

    exclude = [
      "cache"
      ".cache"
    ];

    pruneOpts = [
      "--keep-last 7"
    ];

    timerConfig = {
      OnCalendar = "03:00";
      Persistent = true;
    };
  };
}
