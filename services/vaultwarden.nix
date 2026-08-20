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

  services.caddy.virtualHosts."vault.kaaz.top".extraConfig = ''
    encode zstd gzip
    reverse_proxy localhost:8222 {
      header_up X-Real-IP {remote_host}
    }
  '';

  services.cloudflare-ddns.ip4Domains = [ "vault.kaaz.top" ];
}
