{ ... }:
{
  imports = [
    ../home/shared/packages.nix
    ../home/shared/stylix.nix
    ../home/shared/configs.nix
    ../home/shared/other.nix
  ];

  home = {
    username = "jofre";
    homeDirectory = "/home/jofre";
  };

  programs = {
    git = {
      enable = true;
      userName = "Jofr3";
      userEmail = "jofrescari@gmail.com";
    };

    ssh.enable = true;
  };
  
  home.stateVersion = "24.05";
}
