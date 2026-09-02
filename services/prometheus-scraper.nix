{
  services.prometheus = {
    enable = true;
    port = 9090;

    scrapeConfigs = [
      {
        job_name = "node";
        static_configs = [
          {
            targets = [
              "aether:9099"
              "phantom:9099"
              "specter:9099"
            ];
          }
        ];
      }
    ];
  };
}
