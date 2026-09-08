{
  services.cloudflare-ddns = {
    enable = true;
    proxied = "true";
    credentialsFile = "/var/lib/secrets/cloudflare-ddns/token";
  };
}
