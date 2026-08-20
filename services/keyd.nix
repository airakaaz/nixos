{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ]; # what goes into the [id] section, here we select all keyboards
        settings = {
          main = {
            capslock = "leftmeta";
          };
          alt = {
            capslock = "capslock";
          };
        };
      };
    };
  };
}
