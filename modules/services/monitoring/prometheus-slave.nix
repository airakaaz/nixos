{ hostname, ... }:

{
  services.prometheus = {
    enable = true;
    port = 9090;
    listenAddress = "${hostname}";
    retentionTime = "14d";

    globalConfig = {
      scrape_interval = "30s";
      evaluation_interval = "30s";
      external_labels = {
        nodename = "${hostname}";
      };
    };

    exporters = {
      node = {
        enable = true;
        listenAddress = "${hostname}";
        port = 9099;
        enabledCollectors = [
          "systemd"
          "processes"
        ];
      };
    };

    scrapeConfigs = [
      {
        job_name = "node";
        static_configs = [
          {
            targets = [ "${hostname}:9099" ];
          }
        ];
      }
    ];

    remoteWrite = [
      {
        url = "http://specter:9090/api/v1/write";
      }
    ];
  };
}
