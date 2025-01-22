{ pkgs, ... }:
{
  imports = [
    ../home/shared/packages.nix
    ../home/shared/stylix.nix
    ../home/shared/configs.nix
  ];

  home = {
    username = "jofrelsw";
    homeDirectory = "/home/jofrelsw";

    packages = with pkgs; [
      vscode
      dbeaver-bin
      openconnect
    ];
  };

  wayland.windowManager.hyprland.enable = true;

  programs = {
    git = {
      enable = true;
      userName = "JofreLSW";
      userEmail = "jofrelsw@gmail.com";
    };

    ssh.enable = true;
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
  
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
