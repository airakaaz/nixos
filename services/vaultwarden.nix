{
  services.vaultwarden = {
    enable = true;
    # on 1st setup allow signups and create the env file
    # env file created with `vaultwarden hash`

    config = {
      DOMAIN = "https://vault.kaaz.top";
      SIGNUPS_ALLOWED = false;

      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;
    };

    environmentFile = "/var/lib/vaultwarden/vaultwarden.env";
  };

  services.fail2ban.jails.vaultwarden = {
    filter = {
      Definition = {
        failregex = ".*Username or password is incorrect\\. Try again\\. IP: <HOST>.*";
        journalmatch = "_SYSTEMD_UNIT=vaultwarden.service";
      };
    };
    settings = {
      findtime = 15 * 60;
      maxretry = 5;
      bantime = 1 * 60 * 60;
    };
  };

  services.caddy.virtualHosts."vault.kaaz.top".extraConfig = ''
    encode zstd gzip
    reverse_proxy localhost:8222 {
      header_up X-Real-IP {remote_host}
    }
  '';

  services.cloudflare-ddns.ip4Domains = [ "vault.kaaz.top" ];
}
