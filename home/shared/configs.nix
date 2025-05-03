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
  };
}
