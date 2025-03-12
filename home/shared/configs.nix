{ pkgs, ... }:
let
  myConfig = pkgs.fetchFromGitHub {
    owner = "Jofr3";
    repo = ".dotfiles";
    rev = "e1fc2d53e1c90893e20ab67d895d2f98937d17d1";
    sha256 = "sha256-HehK7+ofJm+l3Rmpm2Aq1yODXCYLTb94oZaGkcnOl9Q=";
  };
in 
{
  home.file = {
    ".config/hypr".source = "${myConfig}/config/hypr";
    ".config/foot".source = "${myConfig}/config/foot";
    ".config/fish".source = "${myConfig}/config/fish";
    ".config/nvim".source = "${myConfig}/config/nvim";
    ".config/kitty".source = "${myConfig}/config/kitty";
    ".config/zellij".source = "${myConfig}/config/zellij";
    ".config/wezterm".source = "${myConfig}/config/wezterm";
  };
}
