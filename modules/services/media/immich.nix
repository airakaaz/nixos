{
  services.immich = {
    enable = true;
    port = 2283;
    mediaLocation = "/media/storage/phantom/immich";
    accelerationDevices = [
      "/dev/dri/renderD128"
      "/dev/dri/renderD129"
    ];
  };

  services.caddy.virtualHosts."immich.kaaz.top".extraConfig = ''
    reverse_proxy localhost:2283
  '';

  services.cloudflare-ddns.ip4Domains = [ "immich.kaaz.top" ];

  services.fail2ban.jails.immich = {
    filter = {
      Definition = {
        failregex = "^.*Failed login attempt for user .* from ip address <HOST>.*$";
        journalmatch = "_SYSTEMD_UNIT=immich-server.service";
      };
    };
    settings = {
      port = "http,https";
      maxretry = 5;
      findtime = 15 * 60;
      bantime = 1 * 60 * 60;
    };
  };

}
