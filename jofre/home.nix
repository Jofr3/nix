{
  _lib,
  pkgs,
  _inputs,
  ...
}:
{
  imports = [
    ../home/shared/packages.nix
    ../home/shared/stylix.nix
    ../home/shared/configs.nix
  ];

  home = {
    username = "jofre";
    homeDirectory = "/home/jofre";
  };

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "Jofr3";
      userEmail = "jofrescari@gmail.com";
    };

    ssh.enable = true;
  };

  home.stateVersion = "24.05";
}
