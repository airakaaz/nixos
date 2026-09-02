{
  programs.ssh.knownHosts.phantom = {
    extraHostNames = [ "100.64.0.1" ];
    publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGyc3McUeBfsggm/sPlV1jtYQN5W8EjlKzY739Ln0q4O";
  };

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

    pruneOpts = [
      "--keep-last 7"
    ];

    timerConfig = {
      OnCalendar = "03:00";
      Persistent = true;
    };
  };
}
