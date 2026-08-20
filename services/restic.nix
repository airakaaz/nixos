{
  services.restic.backups = {
    system = {
      initialize = true;
      inhibitsSleep = true;
      passwordFile = "/var/lib/secrets/restic/restic-passwd";

      paths = [
        "/var/lib"
        "/etc/nixos"
      ];
      exclude = [ "*cache" ];
      repository = "/media/storage/phantom/restic-backup";

      timerConfig = {
        OnCalendar = "03:00";
        Persistent = true;
      };
    };
  };
}
