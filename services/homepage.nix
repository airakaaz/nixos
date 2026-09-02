{
  services.homepage-dashboard = {
    enable = true;
    allowedHosts = "home.kaaz.top";
    listenPort = 8080;
    environmentFiles = [ "/var/lib/secrets/homepage/env" ];

    settings = {
      title = "aira.kaaz";
      headerStyle = "clean";
      statusStyle = "dot";
      useEqualHeights = true;
      cardBlur = "sm";
      disableCollapse = false;
      hideVersion = true;
      quicklaunch.searchDescription = true;
      color = "neutral";
      layout = [
        {
          Phantom = {
            header = false;
            style = "row";
            columns = 5;
          };
        }
        {
          Specter = {
            header = false;
            style = "row";
            columns = 5;
          };
        }
        {
          DNS = {
            style = "row";
            columns = 3;
          };
        }
        {
          Monitoring = {
            style = "row";
            columns = 1;
          };
        }
        {
          Services = {
            style = "row";
            columns = 2;
          };
        }
        {
          "Google Workspace" = {
            iconsOnly = true;
          };
        }
        {
          Hosts = {
            style = "row";
            columns = 3;
          };
        }
        {
          Torrenting = {
            style = "row";
            columns = 2;
          };
        }
      ];
    };

    services = [
      {
        Specter = [
          {
            Info = {
              widget = {
                type = "glances";
                url = "http://specter:55000";
                version = 4;
                metric = "info";
              };
            };
          }
          {
            CPU = {
              widget = {
                type = "glances";
                url = "http://specter:55000";
                version = 4;
                metric = "cpu";
              };
            };
          }
          {
            Memory = {
              widget = {
                type = "glances";
                url = "http://specter:55000";
                version = 4;
                metric = "memory";
              };
            };
          }
          {
            Network = {
              widget = {
                type = "glances";
                url = "http://specter:55000";
                version = 4;
                metric = "network:enp0s6";
              };
            };
          }
          {
            "/" = {
              widget = {
                type = "glances";
                url = "http://specter:55000";
                version = 4;
                metric = "fs:/";
              };
            };
          }
        ];
      }
      {
        Phantom = [
          {
            Info = {
              widget = {
                type = "glances";
                url = "http://phantom:55000";
                version = 4;
                metric = "info";
              };
            };
          }
          {
            CPU = {
              widget = {
                type = "glances";
                url = "http://phantom:55000";
                version = 4;
                metric = "cpu";
              };
            };
          }
          {
            Memory = {
              widget = {
                type = "glances";
                url = "http://phantom:55000";
                version = 4;
                metric = "memory";
              };
            };
          }
          {
            Network = {
              widget = {
                type = "glances";
                url = "http://phantom:55000";
                version = 4;
                metric = "network:enp0s31f6";
              };
            };
          }
          {
            "/" = {
              widget = {
                type = "glances";
                url = "http://phantom:55000";
                version = 4;
                metric = "fs:/";
              };
            };
          }
        ];
      }
      {
        DNS = [
          {
            "AdGuard Home (phantom)" = {
              href = "https://p.dns.kaaz.top";
              icon = "si-adguard-#68BC71";
              # description = "DNS and network filtering";
              widget = {
                type = "adguard";
                url = "https://p.dns.kaaz.top";
                username = "{{HOMEPAGE_VAR_ADGUARD_USERNAME}}";
                password = "{{HOMEPAGE_VAR_ADGUARD_PASSWORD}}";
              };
            };
          }
          {
            "AdGuard Home (specter)" = {
              href = "https://s.dns.kaaz.top";
              icon = "si-adguard-#68BC71";
              # description = "DNS and network filtering";
              widget = {
                type = "adguard";
                url = "https://s.dns.kaaz.top";
                username = "{{HOMEPAGE_VAR_ADGUARD_USERNAME}}";
                password = "{{HOMEPAGE_VAR_ADGUARD_PASSWORD}}";
              };
            };
          }
          {
            "Cloudflare Dashboard" = {
              href = "https://dash.cloudflare.com";
              icon = "si-cloudflare-#F38020";
            };
          }
        ];
      }
      {
        Monitoring = [
          {
            "Uptime Kuma" = {
              href = "https://up.kaaz.top/status/main";
              icon = "si-uptimekuma-#5CDD8B";
              # description = "Service monitoring";
              widget = {
                type = "uptimekuma";
                url = "https://up.kaaz.top/";
                slug = "main";
              };
            };
          }
        ];
      }
      {
        Services = [
          {
            Jellyfin = {
              href = "https://watch.kaaz.top";
              icon = "jellyfin";
              # description = "Movies and shows";
              widget = {
                type = "jellyfin";
                url = "https://watch.kaaz.top";
                key = "{{HOMEPAGE_VAR_JELLYFIN_KEY}}";
                version = 2;
                enableBlocks = true;
                enableNowPlaying = true;
                enableUser = true;
                enableMediaControl = true;
                showEpisodeNumber = true;
              };
            };
          }
          {
            Immich = {
              href = "https://immich.kaaz.top";
              icon = "immich";
              # description = "Photo library";
              widget = {
                type = "immich";
                url = "https://immich.kaaz.top";
                key = "{{HOMEPAGE_VAR_IMMICH_KEY}}";
                version = 2;
              };
            };
          }
          {
            Vaultwarden = {
              href = "https://vault.kaaz.top";
              icon = "si-vaultwarden";
              # description = "Password manager";
              siteMonitor = "https://vault.kaaz.top";
            };
          }
        ];
      }
      {
        Torrenting = [
          {
            qBittorrent = {
              href = "https://qbt.kaaz.top";
              icon = "si-qbittorrent-#2F67BA";
              # widget = {
              #   type = "qbittorrent";
              #   url = "https://qbt.kaaz.top";
              #   key = "{{HOMEPAGE_VAR_QBT_KEY}}";
              # };
            };
          }
          {
            ext = {
              href = "https://ext.to";
              icon = "https://ext.to/favicon.ico";
            };
          }
        ];
      }
      {
        Hosts = [
          {
            Phantom = {
              href = "https://phantom.kaaz.top";
              icon = "si-nixos";
              description = "Home Server";
              ping = "phantom";
            };
          }
          {
            Specter = {
              href = "https://specter.kaaz.top";
              icon = "si-nixos";
              description = "Cloud Server";
              ping = "specter";
            };
          }
          {
            Aether = {
              href = "http://aether:9090";
              icon = "si-archlinux";
              description = "Daily Laptop";
              ping = "aether";
            };
          }
        ];
      }
    ];

    bookmarks = [
      {
        "Google Workspace" = [
          {
            drive = [
              {
                href = "https://drive.google.com";
                icon = "google-drive";
              }
            ];
          }
          {
            gmail = [
              {
                href = "https://mail.google.com";
                icon = "gmail";
              }
            ];
          }
          {
            calendar = [
              {
                href = "https://calendar.google.com";
                icon = "google-calendar";
              }
            ];
          }
          {
            keep = [
              {
                href = "https://keep.google.com";
                icon = "google-keep";
              }
            ];
          }
          {
            docs = [
              {
                href = "https://docs.google.com";
                icon = "google-docs";
              }
            ];
          }
          {
            sheets = [
              {
                href = "https://sheets.google.com";
                icon = "google-sheets";
              }
            ];
          }
          {
            tasks = [
              {
                href = "https://tasks.google.com";
                icon = "google-tasks";
              }
            ];
          }
          {
            classroom = [
              {
                href = "https://classroom.google.com";
                icon = "google-classroom";
              }
            ];
          }
          {
            home = [
              {
                href = "https://home.google.com";
                icon = "google-home";
              }
            ];
          }
          {
            maps = [
              {
                href = "https://maps.google.com";
                icon = "google-maps";
              }
            ];
          }
          {
            translate = [
              {
                href = "https://translate.google.com";
                icon = "google-translate";
              }
            ];
          }
          {
            notebooklm = [
              {
                href = "https://notebooklm.google.com";
                icon = "notebook-lm";
              }
            ];
          }
        ];
      }
      {
        "Quick links" = [
          {
            "Landing Page" = [
              {
                abbr = "KA";
                href = "https://aira.kaaz.top";
              }
            ];
          }
          {
            GitHub = [
              {
                abbr = "GH";
                href = "https://github.com/airakaaz";
              }
            ];
          }
          {
            Instagram = [
              {
                abbr = "IG";
                href = "https://instagram.com/kizo_aria";
              }
            ];
          }
          {
            "Arch Wiki" = [
              {
                abbr = "AR";
                href = "https://wiki.archlinux.org/";
              }
            ];
          }
          {
            "NixOS Wiki" = [
              {
                abbr = "NX";
                href = "https://wiki.nixos.org/";
              }
            ];
          }
        ];
      }
    ];

    # widgets = [
    #   {
    #     datetime = {
    #       text_size = "xl";
    #       format = {
    #         dateStyle = "medium";
    #         timeStyle = "short";
    #       };
    #     };
    #   }
    #   {
    #     resources = {
    #       cpu = true;
    #       memory = true;
    #       disk = "/";
    #       uptime = true;
    #     };
    #   }
    # ];

    customCSS = ''
       @import url('https://fonts.googleapis.com/css2?family=Archivo+Black&family=Bungee&family=Roboto+Mono:wght@400;500;600;700&display=swap');

       :root {
         --aira-accent: #ff2a3d;
         --aira-font: "Roboto Mono", ui-monospace, SFMono-Regular, Menlo, monospace;
         --aira-display: "Archivo Black", var(--aira-font), sans-serif;
         --aira-deco: "Bungee", var(--aira-font), sans-serif;
       }

       html,
       body {
         font-family: var(--aira-font) !important;
       }

       h1,
       h2,
       h3,
       h4,
       [class*="group-title"] {
         font-family: var(--aira-display) !important;
         letter-spacing: -0.04em !important;
         text-transform: uppercase;
       }

       [class*="group-title"] {
         font-size: 0.78rem !important;
         letter-spacing: 0.08em !important;
       }

       [class*="service-card"]:hover,
       [class*="bookmark-card"]:hover {
         background: var(--aira-panel-hover) !important;
         border-color: var(--aira-accent) !important;
         transform: translateY(-2px);
       }

       [class*="service-card"] svg,
       [class*="bookmark-card"] svg {
         color: var(--aira-accent) !important;
       }

       [class*="service-name"],
       [class*="bookmark-name"] {
         font-family: var(--aira-font) !important;
         font-weight: 600 !important;
         letter-spacing: -0.03em !important;
       }

       [class*="service-description"] {
         font-size: 0.68rem !important;
       }

       [class*="status"] {
         color: var(--aira-accent) !important;
       }

       input,
       button,
       [role="button"] {
         font-family: var(--aira-font) !important;
       }

      ::selection {
         background: var(--aira-accent) !important;
         color: #ffffff !important;
       }

       ::-webkit-scrollbar {
         width: 6px;
         height: 6px;
       }

       ::-webkit-scrollbar-track {
         background: transparent;
       }

       ::-webkit-scrollbar-thumb {
         background: #333333;
         border-radius: 10px;
       }
    '';
  };

  services.caddy.virtualHosts."home.kaaz.top".extraConfig = ''
    tls internal
    encode zstd gzip
    reverse_proxy localhost:8080
  '';
}
