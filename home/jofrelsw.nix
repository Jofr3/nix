{ pkgs, ... }:
{
  imports = [
    ../home/shared/packages.nix
    ../home/shared/stylix.nix
    ../home/shared/configs.nix
    ../home/shared/other.nix
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

  programs = {
    git = {
      enable = true;
      userName = "JofreLSW";
      userEmail = "jofrelsw@gmail.com";
    };

    ssh.enable = true;
  };
  
  home.stateVersion = "24.05";
}
