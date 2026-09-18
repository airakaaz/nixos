{ hostname, ... }:

{
  services.alloy = {
    enable = true;
    extraFlags = [
      "--storage.path=/var/lib/alloy"
      "--stability.level=experimental"
    ];
  };

  environment.etc."alloy/config.alloy".text = ''
    loki.write "default" {
      endpoint {
        url = "http://specter:3100/loki/api/v1/push"
      }

      wal {
        enabled         = true
        max_segment_age = "168h"
      }
    }

    loki.relabel "journal" {
      forward_to = [loki.write.default.receiver]

      rule {
        source_labels = ["__journal__systemd_unit"]
        target_label  = "unit"
      }
    }

    loki.source.journal "read" {
      max_age    = "168h"
      forward_to = [loki.relabel.journal.receiver]

      labels = {
        job  = "systemd-journal",
        host = "${hostname}",
      }
    }
  '';
}
