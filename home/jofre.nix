{ pkgs, lib, zellij-sessionizer, zellij-bar, ... }:
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
      dbeaver-bin
      vscode
      openconnect
      lan-mouse

      overskride

      hyprpicker
      vivaldi
      wdisplays
      gaphor
      discord

      # abduco
      zellij
      foot
      fzf
    ];
  };

  wayland.windowManager.hyprland.enable = true;

  programs = {
    git = {
      enable = true;
      userName = "Jofr3";
      userEmail = "jofrescari@gmail.com";
      includes = [
          {
            condition = "gitdir:~/lsw/";
            contents = {
              user.name = "JofreLSW";
              user.email = "jofrelsw@gmail.com";
            };
          }
        ];
    };

    ssh.enable = true;
  };

  home.activation.copyZellijSessionizer = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p $HOME/.config/zellij/plugins
    cp -n ${zellij-sessionizer} $HOME/.config/zellij/plugins/sessionizer.wasm
    cp -n ${zellij-bar} $HOME/.config/zellij/plugins/bar.wasm
  '';

  systemd.user.startServices = "sd-switch";

  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
