{ pkgs, ... }:

{
  services.glances = {
    enable = true;
    package = pkgs.glances.overridePythonAttrs (old: {
      disabledTests = (old.disabledTests or []) ++ [ "test_phys_core_returns_int" ];
    });
    port = 55000;
    # extraArgs = [ "--webserver" "--disable-webui" ];
  };
}
