{ pkgs, ... }:
{
  imports = [
    ../home/shared/packages.nix
    ../home/shared/stylix.nix
    ../home/shared/configs.nix
  ];

  home = {
    username = "jofre";
    homeDirectory = "/home/jofre";

    packages = with pkgs; [
      dbeaver-bin
      vscode
      openconnect
      lan-mouse

      overskride

      hyprpicker
      vivaldi
      wdisplays
      gaphor
      discord

      zellij
      foot
      fzf
      floorp
      firefox
    ];
  };

  wayland.windowManager.hyprland.enable = true;

  programs = {
    git = {
      enable = true;
      userName = "Jofr3";
      userEmail = "jofrescari@gmail.com";
      includes = [
          {
            condition = "gitdir:~/lsw/";
            contents = {
              user.name = "JofreLSW";
              user.email = "jofrelsw@gmail.com";
            };
          }
        ];
    };

    ssh.enable = true;
  };

  systemd.user.startServices = "sd-switch";

  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
