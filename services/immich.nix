{
  services.immich = {
    enable = true;
    mediaLocation = "/media/storage/phantom/immich";
    accelerationDevices = [
      "/dev/dri/renderD128"
      "/dev/dri/renderD129"
    ];
  };

  services.caddy.virtualHosts."immich.kaaz.top".extraConfig = ''
    reverse_proxy localhost:2283
  '';

  services.cloudflare-ddns.ip4Domains = [ "immich.kaaz.top" ];
}
