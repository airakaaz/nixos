{
  services.jellyfin = {
    enable = true;
    hardwareAcceleration = {
      enable = true;
      device = "/dev/dri/renderD128";
    };
  };

  services.caddy.virtualHosts."watch.kaaz.top".extraConfig = ''
    reverse_proxy localhost:8096
  '';

  services.cloudflare-ddns.ip4Domains = [ "watch.kaaz.top" ];

  services.fail2ban.jails.jellyfin = {
    filter = {
      Definition = {
        failregex = "^.*Authentication request for .* has been denied \(IP: [\"]?<HOST>[\"]?\).*";
        journalmatch = "_SYSTEMD_UNIT=jellyfin.service";
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
