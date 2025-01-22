{ pkgs, ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowInsecure = true;
    };
  };

  home.packages = with pkgs; [
      xdg-desktop-portal-hyprland
      lan-mouse
      htop
  ];
}
