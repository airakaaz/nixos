{
  networking.bridges.virbr1.interfaces = [ ];

  networking.interfaces.virbr1.ipv4.addresses = [
    {
      address = "10.10.10.1";
      prefixLength = 24;
    }
  ];

  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
}
