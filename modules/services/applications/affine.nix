{ config, ... }:

{
  systemd.services.affine-docker-network = {
    description = "Create the private AFFiNE Docker network";
    wantedBy = [ "multi-user.target" ];
    wants = [ "docker.service" ];
    after = [ "docker.service" ];
    before = [
      "docker-affine-postgres.service"
      "docker-affine-redis.service"
      "docker-affine-migration.service"
      "docker-affine.service"
    ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      ${config.virtualisation.docker.package}/bin/docker network inspect affine >/dev/null 2>&1 \
        || ${config.virtualisation.docker.package}/bin/docker network create --driver bridge affine
    '';
  };

  virtualisation.oci-containers.containers = {
    affine-postgres = {
      image = "pgvector/pgvector:pg16";
      networks = [ "affine" ];
      volumes = [ "/var/lib/affine/postgres:/var/lib/postgresql/data" ];
      environment = {
        POSTGRES_USER = "affine";
        POSTGRES_DB = "affine";
        POSTGRES_INITDB_ARGS = "--data-checksums";
        POSTGRES_HOST_AUTH_METHOD = "trust";
      };
      autoStart = true;
    };

    affine-redis = {
      image = "redis:7-alpine";
      networks = [ "affine" ];
      autoStart = true;
    };

    affine-migration = {
      image = "ghcr.io/toeverything/affine:stable";
      networks = [ "affine" ];
      volumes = [
        "/var/lib/affine/storage:/root/.affine/storage"
        "/var/lib/affine/config:/root/.affine/config"
      ];
      environment = {
        REDIS_SERVER_HOST = "affine-redis";
        DATABASE_URL = "postgresql://affine@affine-postgres:5432/affine";
        AFFINE_INDEXER_ENABLED = "false";
        AFFINE_SERVER_EXTERNAL_URL = "https://notes.kaaz.top";
      };
      cmd = [
        "sh"
        "-c"
        "until node -e 'const net=require(\"net\"); const s=net.connect(5432,\"affine-postgres\",()=>{s.destroy();process.exit(0)}); s.on(\"error\",()=>process.exit(1))'; do sleep 2; done; node ./scripts/self-host-predeploy.js"
      ];
      dependsOn = [ "affine-postgres" "affine-redis" ];
      autoStart = true;
    };

    affine = {
      image = "ghcr.io/toeverything/affine:stable";
      networks = [ "affine" ];
      ports = [ "127.0.0.1:3010:3010" ];
      volumes = [
        "/var/lib/affine/storage:/root/.affine/storage"
        "/var/lib/affine/config:/root/.affine/config"
      ];
      environment = {
        REDIS_SERVER_HOST = "affine-redis";
        DATABASE_URL = "postgresql://affine@affine-postgres:5432/affine";
        AFFINE_INDEXER_ENABLED = "false";
        AFFINE_SERVER_EXTERNAL_URL = "https://notes.kaaz.top";
      };
      dependsOn = [ "affine-postgres" "affine-redis" "affine-migration" ];
      autoStart = true;
    };
  };

  services.cloudflare-ddns.ip4Domains = [ "notes.kaaz.top" ];

  services.caddy.virtualHosts."notes.kaaz.top".extraConfig = ''
    reverse_proxy localhost:3010
  '';
}
