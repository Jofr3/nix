{ pkgs, ... }: {
  imports = [
    ../home/shared/packages.nix
    ../home/shared/stylix.nix
    ../home/shared/configs.nix
    # ../home/shared/scripts.nix
    ../home/shared/hyprland.nix
  ];

  home = {
    username = "jofre";
    homeDirectory = "/home/jofre";

    packages = with pkgs; [
      dbeaver-bin

      overskride

      hyprpicker

      skim
      postman

      libreoffice-qt

      tree-sitter-grammars.tree-sitter-zig

      syncthing
    ];
  };

  services = {
    hyprpaper = {
      enable = true;
      settings = {
        ipc = false;
        preload = [ "~/.dotfiles/wallpapers/16.png" ];

        wallpaper = [ "eDP-1,~/.dotfiles/wallpapers/16.png" ];
      };
    };
    syncthing = { enable = true; };
  };

  programs = {
    git = {
      enable = true;
      userName = "Jofr3";
      userEmail = "jofrescari@gmail.com";
      includes = [{
        condition = "gitdir:~/lsw/";
        contents = {
          user.name = "JofreLSW";
          user.email = "jofrelsw@gmail.com";
        };
      }];
    };

    ssh = {
      enable = true;

      controlMaster = "auto";
      controlPath = "~/.ssh/control-%r@%h:%p";
      controlPersist = "10m";

      matchBlocks = {
        "myclientum_dev" = {
          hostname = "dev.myclientum.com";
          user = "dev_myclientum_com";
          port = 22;
          identityFile = "~/.ssh/keys/jofre_key.pem";
        };
      };
    };
  };

  systemd.user.startServices = "sd-switch";

  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
