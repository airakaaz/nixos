{
  services.adguardhome = {
    enable = true;
    port = 3000;
  };

  services.tailscale.serve.services.adguard = {
    endpoints = {
      "tcp:80" = "http://localhost:3000";
    };
    advertised = true;
  };
}
