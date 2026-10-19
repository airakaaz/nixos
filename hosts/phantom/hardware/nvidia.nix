{ config, pkgs, ... }:

let
  btop-gpu = pkgs.btop.overrideAttrs (old: {
    nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ pkgs.patchelf ];
    postFixup = (old.postFixup or "") + ''
      patchelf --add-rpath /run/opengl-driver/lib $out/bin/btop
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

  environment.systemPackages = with pkgs; [
    nvtopPackages.nvidia
  ];
}
