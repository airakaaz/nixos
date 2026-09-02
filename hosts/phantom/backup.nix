{
  services.restic.backups.phantom = {
    initialize = true;
    inhibitsSleep = true;
    passwordFile = "/var/lib/secrets/restic/restic-passwd";
    repository = "/media/storage/phantom/restic/phantom";

    paths = [
      "/var/lib/secrets"
      "/var/lib/postgresql"
      "/var/lib/immich"
      "/var/lib/redis-immich"
      "/var/lib/jellyfin"
      "/var/lib/qBittorrent"
      "/var/lib/AdGuardHome"
      "/var/lib/caddy"
    ];

    extraBackupArgs = [
      "--exclude-caches"
    ];

    exclude = [
      "cache"
      ".cache"
    ];

    timerConfig = {
      OnCalendar = "03:00";
      Persistent = true;
    };
  };
}
