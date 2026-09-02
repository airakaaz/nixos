{
  services.restic.backups.specter = {
    initialize = true;
    inhibitsSleep = true;
    passwordFile = "/var/lib/secrets/restic/restic-passwd";
    repository = "sftp:kaz@phantom:/media/storage/phantom/restic/specter";

    paths = [
      "/var/lib/secrets"
      "/var/lib/vaultwarden"
      "/var/lib/grafana"
      "/var/lib/prometheus2"
      "/var/lib/uptime-kuma"
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
