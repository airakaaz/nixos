{ hostname, ... }:

{
  services.prometheus = {
    enable = true;
    port = 9090;
    extraFlags = [ "--web.enable-remote-write-receiver" ];

    globalConfig = {
      scrape_interval = "30s";
      evaluation_interval = "30s";
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
            targets = [
              "${hostname}:9099"
            ];
          }
        ];
      }
    ];
  };
}
