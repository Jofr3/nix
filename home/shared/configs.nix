# { pkgs, ... }:
# let
#   myConfig = pkgs.fetchFromGitHub {
#     owner = "Jofr3";
#     repo = ".dotfiles";
#     rev = "e1fc2d53e1c90893e20ab67d895d2f98937d17d1";
#     sha256 = "sha256-fxMWJ02jeOh9ofU3N4gikOx1M6pu30Dx7fukn/TKVsQ=";
#   };
# in 
# {
#   home.file = {
#     ".config/hypr".source = "${myConfig}/config/hypr";
#     ".config/foot".source = "${myConfig}/config/foot";
#     ".config/fish".source = "${myConfig}/config/fish";
#     ".config/nvim".source = "${myConfig}/config/nvim";
#     ".config/kitty".source = "${myConfig}/config/kitty";
#     ".config/zellij".source = "${myConfig}/config/zellij";
#     ".config/wezterm".source = "${myConfig}/config/wezterm";
#     ".config/wayfire.ini".source = "${myConfig}/config/wayfire.ini";
#   };
# }

{ config, ... }:
let
  dotfiles = config.lib.file.mkOutOfStoreSymlink "/home/jofre/.dotfiles";
in
{
  xdg.configFile = {
    hypr.source = "${dotfiles}/config/hypr";
    foot.source = "${dotfiles}/config/foot";
    fish.source = "${dotfiles}/config/fish";
    tofi.source = "${dotfiles}/config/tofi";
    nvim.source = "${dotfiles}/config/nvim";
    kitty.source = "${dotfiles}/config/kitty";
    zellij.source = "${dotfiles}/config/zellij";
    wezterm.source = "${dotfiles}/config/wezterm";
    "wayfire.ini".source = "${dotfiles}/config/wayfire/wayfire.ini";    
  };
}
