{ inputs, lib, config, pkgs, ... }: 
{
  imports = [ ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "jofre";
    homeDirectory = "/home/jofre";
  };

  home.packages = with pkgs; [ 
  	cowsay 
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
