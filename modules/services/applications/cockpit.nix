{ pkgs, hostname, ... }:

{
  services.cockpit = {
    enable = true;

    port = 9060;
    allowed-origins = [
      "https://localhost:9060"
      "https://${hostname}:9060"
      "https://${hostname}.dojo-scoville.ts.net:9060"
      "https://${hostname}.kaaz.top"
    ];

    plugins = with pkgs; [
      cockpit-files
      cockpit-machines
      cockpit-dockermanager
    ];
  };

  services.caddy.virtualHosts."${hostname}.kaaz.top".extraConfig = ''
    tls internal
    reverse_proxy localhost:9060
  '';
}
