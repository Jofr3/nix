{ pkgs, ... }:
let
  myConfig = pkgs.fetchFromGitHub {
    owner = "Jofr3";
    repo = ".dotfiles";
    rev = "e1fc2d53e1c90893e20ab67d895d2f98937d17d1";
    sha256 = "sha256-eBhm1X5I6SZNepSUhlGzeTMhOHA3ngzqwNBcCHZveN0=";
  };
in 
{
  home.file = {
    ".config/hypr".source = "${myConfig}/config/hypr";
    ".config/kitty".source = "${myConfig}/config/kitty";
    ".config/fish".source = "${myConfig}/config/fish";
    ".config/nvim".source = "${myConfig}/config/nvim";
  };
}
