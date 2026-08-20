{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    eza
    fastfetch
    fd
    ripgrep
    kitty # for ssh
  ];

  programs.zoxide = {
    enable = true;
    flags = [ "--cmd cd" ];
  };

  programs.fzf = {
    fuzzyCompletion = true;
    keybindings = true;
  };

  programs.direnv.enable = true;

  programs.starship.enable = true;

  environment.shellAliases = {
    nrs = "sudo nixos-rebuild switch";
    nrt = "sudo nixos-rebuild test";
    nrb = "sudo nixos-rebuild boot";
    nfu = "nix flake update";
    ncg = "sudo nix-collect-garbage";

    sstart = "systemctl start";
    resstart = "systemctl restart";
    sstatus = "systemctl status";
    sstop = "systemctl stop";
    ssstart = "sudo systemctl start";
    ressstart = "sudo systemctl restart";
    ssstatus = "sudo systemctl status";
    ssstop = "sudo systemctl stop";

    lg = "lazygit";

    ls = "eza --icons --group --git --group-directories-first -1";
    l = "ls";
    ll = "ls -l";
    la = "ls -a";
    lla = "ls -al";
    lt = "ls --tree";
    llt = "ls --tree -l";
    lat = "ls --tree -a";
    llat = "ls --tree -al";
  };

  programs.fish = {
    enable = true;
    shellInit = "fish_vi_key_bindings";
  };
  programs.bash.enable = true;
  programs.zsh.enable = true;
}
