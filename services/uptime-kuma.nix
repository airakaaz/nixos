{
  services.uptime-kuma = {
    enable = true;
    settings = {
      PORT = "3001";
      HOST = "localhost";
    };
  };

  services.tailscale.serve.services.kuma = {
    endpoints = {
      "tcp:80" = "http://localhost:3001";
    };
    advertised = true;
  };
}
