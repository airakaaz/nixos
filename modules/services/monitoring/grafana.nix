{
  services.grafana = {
    enable = true;

    settings = {
      server = {
        http_addr = "0.0.0.0";
        http_port = 3002;
      };
      security.secret_key = "$__file{/var/lib/secrets/grafana/grafana-secret}";
    };
  };

  services.caddy.virtualHosts."dash.kaaz.top".extraConfig = ''
    tls internal
    reverse_proxy localhost:3002
  '';
}
