{
  services.prometheus = {
    enable = true;
    # listenAddress = "localhost";
    port = 9090;

    scrapeConfigs = [
      {
        job_name = "node";
        static_configs = [
          {
            targets = [
              "phantom:9100"
              "specter:9100"
            ];
          }
        ];
      }
    ];
  };
}
