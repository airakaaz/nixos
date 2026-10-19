{
  services.restic.backups.phantom = {
    initialize = true;
    inhibitsSleep = true;
    passwordFile = "/var/lib/secrets/restic/restic-passwd";
    repository = "aether:/media/storage/server/restic/phantom";

    paths = [
      "/var/lib/secrets"
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
