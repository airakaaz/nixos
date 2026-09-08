{
  services.fail2ban = {
    enable = true;

    ignoreIP = [
      "127.0.0.1/8"
      "::1"
      "100.64.0.0/10"
    ];

    bantime = "1h";
    maxretry = 5;
    bantime-increment = {
      enable = true;
      maxtime = "1w";
    };
  };
}
