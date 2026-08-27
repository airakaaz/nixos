{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    eza
    fastfetch
    fd
    ripgrep
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

  programs.starship = {
    enable = true;
    transientPrompt.enable = true;
    settings = {
      add_newline = false;
      format = ''
      $hostname$directory$git_branch
      $character'';

      right_format = ''
      $cmd_duration
      '';

      "character" = {
        success_symbol = "[  ](bold fg:243)";
        error_symbol = "[  ](bold fg:244)";
      };

      "package" = {
        disabled = true;
      };

      "username" = {
        style_user = "bold bg:252 fg:235";
        style_root = "red bold";
        format = "[](bold fg:252)[$user]($style)";
        show_always = true;
      };

      "hostname" = {
        ssh_only = true;
        format =  "[](bold fg:252)[$hostname](bg:252 bold fg:235)[](bold fg:252)  ";
        disabled = false;
      };

      "directory" = {
        home_symbol = " ";
        read_only = "  ";
        style = "bg:255 fg:240";
        truncation_length = 2;
        truncation_symbol = ".../";
        format = "[](bold fg:255)[󰉋 :](bold $style)[ $path]($style)[](bold fg:255)";

        substitutions = {
          Desktop = "  ";
          Documents = "  ";
          Downloads = "  ";
          Music = " 󰎈 ";
          Pictures = "  ";
          Videos = "  ";
          Projects = " 󰊤 ";
        };
      };

      "git_branch" = {
        style = "bg:252";
        symbol = "󰘬";
        truncation_length = 12;
        truncation_symbol = "";
        format = " 󰜥 [](bold fg:252)[$symbol $branch(:$remote_branch)](fg:235 bg:252)[ ](bold fg:252)";
      };

      "git_status" = {
        conflicted = " 🏳 ";
        ahead = " 🏎💨 ";
        behind = " 😰 ";
        diverged = " 😵 ";
        untracked = " 🤷 ";
        stashed = " 📦 ";
        modified = " 📝 ";
        staged = "[++\\($count\\)](green)";
        renamed = " ✍️ ";
        deleted = " 🗑 ";
      };

      "cmd_duration" = {
        min_time = 0;
        format = "[](bold fg:252)[󰪢 $duration](bold bg:252 fg:235)[](bold fg:252)";
      };
    };
  };

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
    shellInit = ''
      fish_vi_key_bindings

      function starship_transient_prompt_func
        starship module character
      end

      function fish_greeting
      end
    '';
  };
  programs.bash.enable = true;
  programs.zsh.enable = true;
}
