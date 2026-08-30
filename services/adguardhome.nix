{
  services.adguardhome = {
    enable = true;
    port = 3000;
    settings = {
      dns.upstream_dns = [
        "1.1.1.1"
        "9.9.9.9"
      ];
      querylog.interval = "90d";
      statistics.interval = "90d";
      user_rules = [ "@@||whatismyipaddress.com^$important" ];
      filtering.rewrites = [
        {
          domain = "phantom.kaaz.top";
          answer = "100.64.0.1";
          enabled = true;
        }
        {
          domain = "specter.kaaz.top";
          answer = "100.64.0.2";
          enabled = true;
        }
        {
          domain = "aether.kaaz.top";
          answer = "100.64.0.10";
          enabled = true;
        }
        {
          domain = "watch.kaaz.top";
          answer = "100.64.0.1";
          enabled = true;
        }
        {
          domain = "immich.kaaz.top";
          answer = "100.64.0.1";
          enabled = true;
        }
        {
          domain = "vault.kaaz.top";
          answer = "100.64.0.1";
          enabled = true;
        }
        {
          domain = "qbt.kaaz.top";
          answer = "100.64.0.1";
          enabled = true;
        }
        {
          domain = "vault.kaaz.top";
          answer = "100.64.0.2";
          enabled = true;
        }
        {
          domain = "dash.kaaz.top";
          answer = "100.64.0.2";
          enabled = true;
        }
        {
          domain = "p.dns.kaaz.top";
          answer = "100.64.0.1";
          enabled = true;
        }
        {
          domain = "s.dns.kaaz.top";
          answer = "100.64.0.2";
          enabled = true;
        }
        {
          domain = "kuma.kaaz.top";
          answer = "100.64.0.2";
          enabled = true;
        }
      ];
    };
  };

  services.caddy.virtualHosts."*.dns.kaaz.top".extraConfig = ''
    tls internal
    reverse_proxy localhost:3000
  '';
}
