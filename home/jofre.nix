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
      xdg-desktop-portal-hyprland
      lan-mouse
      htop
    ];
  };

  wayland.windowManager.hyprland.enable = true;

  programs = {
    git = {
      enable = true;
      userName = "Jofr3";
      userEmail = "jofrescari@gmail.com";
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
