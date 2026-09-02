{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  services.fail2ban.jails.sshd.settings = {
    findtime = 10 * 60;
    maxretry = 5;
    bantime = 1 * 60 * 60;
  };
}
