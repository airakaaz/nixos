{
  services.caddy.virtualHosts = {
    "kaaz.top".extraConfig = ''
      redir https://aira.kaaz.top
    '';

    "aira.kaaz.top".extraConfig = ''
      root * /var/www/aira.kaaz

      encode zstd gzip

      @static {
        path *.css *.js *.png *.jpg *.jpeg *.svg *.webp *.ico *.woff *.woff2
      }

      header @static Cache-Control "public, max-age=31536000, immutable"

      @hidden {
        path /.git/*
        path /.env
        path /Caddyfile
      }

      respond @hidden 404

      header {
        Content-Security-Policy "default-src 'self'; script-src 'self'; img-src 'self'; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; font-src 'self' https://fonts.gstatic.com; object-src 'none'; frame-ancestors 'none'; base-uri 'self';"
      }

      header {
        Strict-Transport-Security "max-age=31536000; includeSubDomains; preload"
        X-Content-Type-Options nosniff
        X-Frame-Options DENY
        Referrer-Policy strict-origin-when-cross-origin
        Permissions-Policy "geolocation=(), microphone=(), camera=()"
        -Server
      }

      file_server
    '';
  };

  services.cloudflare-ddns.ip4Domains = [
    "kaaz.top"
    "aira.kaaz.top"
  ];
}
