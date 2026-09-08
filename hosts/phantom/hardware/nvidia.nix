{ config, pkgs, ... }:

let
  btop-gpu = pkgs.btop.overrideAttrs (old: {
    nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ pkgs.makeWrapper ];
    postFixup = (old.postFixup or "") + ''
      wrapProgram $out/bin/btop --set LD_LIBRARY_PATH /run/opengl-driver/lib
    '';
  });
in
{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics.enable = true;

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;

    open = false;
    modesetting.enable = true;
    nvidiaSettings = false;
  };

  security.wrappers.btop = {
    owner = "root";
    group = "root";
    capabilities = "cap_perfmon+ep";
    source = "${btop-gpu}/bin/btop";
  };
}
