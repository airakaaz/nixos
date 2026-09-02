{
  services.adguardhome = {
    enable = true;
    port = 3000;
    mutableSettings = false;
    settings = {
      users = [
        {
          name = "kaz";
          password = "$2a$10$x2u76NroVzca7zS/c/vP3ODEQe8YiupIjWmBTAd1EiZ.aYEjPTEim";
        }
      ];
      dns = {
        upstream_dns = [
          "1.1.1.1"
          "9.9.9.9"
        ];
        bootstrap_dns = [
          "1.1.1.1"
          "9.9.9.9"
        ];
      };
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
          domain = "up.kaaz.top";
          answer = "100.64.0.2";
          enabled = true;
        }
        {
          domain = "home.kaaz.top";
          answer = "100.64.0.2";
          enabled = true;
        }
      ];
      filters = [
        {
          enabled = true;
          url = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_1.txt";
          name = "AdGuard DNS filter";
          id = 1;
        }
        {
          enabled = true;
          url = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_2.txt";
          name = "AdAway Default Blocklist";
          id = 2;
        }
        {
          enabled = false;
          url = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_70.txt";
          name = "1Hosts (Xtra)";
          id = 1786309258;
        }
        {
          enabled = true;
          url = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_27.txt";
          name = "OISD Blocklist Big";
          id = 1786309259;
        }
        {
          enabled = true;
          url = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_30.txt";
          name = "Phishing URL Blocklist (PhishTank and OpenPhish)";
          id = 1786309260;
        }
        {
          enabled = true;
          url = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_10.txt";
          name = "Scam Blocklist by DurableNapkin";
          id = 1786309261;
        }
        {
          enabled = true;
          url = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_42.txt";
          name = "ShadowWhisperer's Malware List";
          id = 1786309262;
        }
        {
          enabled = true;
          url = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_31.txt";
          name = "Stalkerware Indicators List";
          id = 1786309263;
        }
        {
          enabled = true;
          url = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_9.txt";
          name = "The Big List of Hacked Malware Web Sites";
          id = 1786309264;
        }
        {
          enabled = true;
          url = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_50.txt";
          name = "uBlock₀ filters – Badware risks";
          id = 1786309265;
        }
        {
          enabled = true;
          url = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_11.txt";
          name = "Malicious URL Blocklist (URLHaus)";
          id = 1786309266;
        }
        {
          enabled = true;
          url = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_59.txt";
          name = "AdGuard DNS Popup Hosts filter";
          id = 1786309267;
        }
        {
          enabled = true;
          url = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_69.txt";
          name = "ShadowWhisperer Tracking List";
          id = 1786309268;
        }
        {
          enabled = true;
          url = "https://adguardteam.github.io/HostlistsRegistry/assets/filter_33.txt";
          name = "Steven Black's List";
          id = 1786309269;
        }
      ];
      log = {
        enabled = true;
        file = "";
        max_backups = 0;
        max_size = 100;
        max_age = 3;
        compress = false;
        local_time = false;
        verbose = false;
      };
    };
  };

  services.caddy.virtualHosts."*.dns.kaaz.top".extraConfig = ''
    tls internal
    reverse_proxy localhost:3000
  '';
}
