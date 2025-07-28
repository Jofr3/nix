{ pkgs, ... }: {
  imports = [
    ../home/shared/packages.nix
    ../home/shared/stylix.nix
    ../home/shared/configs.nix
    # ../home/shared/scripts.nix
    ../home/shared/hyprland.nix
    ../home/shared/ssh.nix
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
  };

  systemd.user.startServices = "sd-switch";

  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
