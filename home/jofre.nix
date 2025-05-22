{ pkgs, ... }: {
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

      openconnect
      lan-mouse

      overskride

      hyprpicker

      firefox
      harlequin
    ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "MOD3";

      animations = { enabled = false; };

      general = {
        border_size = 0;
        gaps_in = 0;
        gaps_out = 0;
      };

      input = {
        kb_layout = "us,ca";
        kb_options = "caps:hyper";
      };

      bind = [
        "$mod, C, killactive"
        "$mod, Return, exec, foot"
        "$mod, T, togglefloating"
        "$mod, F, exec, exec $(tofi-run --drun-launch=true --fuzzy-match=true)"
        "$mod, B, exec, ~/.config/tofi/scripts/bookmarks.fish"
        ''
          $mod, X, exec, grim -g "$(slurp)" "/home/jofre/Documents/screenshots/$(date +%Y%m%d-%H%M%S)".png''
        "$mod, I, exec, brightnessctl set 5%-"
        "$mod, O, exec, brightnessctl set +5%"
        "$mod, Up, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
        "$mod, Down, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
        "$mod, Space, exec, playerctl play-pause"
        "$mod, Left, exec, playerctl previous"
        "$mod, Right, exec, playerctl next"
        "$mod, Space, exec, hyprctl switchxkblayout active next"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 7, workspace, 5"
        "$mod, 8, workspace, 6"
        "$mod, 9, workspace, 7"
        "$mod, 0, workspace, 8"

        "$mod SUPER, 1, movetoworkspace, 1"
        "$mod SUPER, 2, movetoworkspace, 2"
        "$mod SUPER, 3, movetoworkspace, 3"
        "$mod SUPER, 4, movetoworkspace, 4"
        "$mod SUPER, 7, movetoworkspace, 5"
        "$mod SUPER, 8, movetoworkspace, 6"
        "$mod SUPER, 9, movetoworkspace, 7"
        "$mod SUPER, 0, movetoworkspace, 8"
      ];

      bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];

      env = [ "XCURSOR_SIZE,24" "HYPRCURSOR_SIZE,24" "QT_CURSOR_SIZE,24" ];

      monitor =
        [ "eDP-1, 1920x1080@60, 0x1080, 1" "HDMI-A-1, 1920x1080@144, 0x0, 1" ];

      workspace = [
        "1, monitor:eDP-1"
        "2, monitor:eDP-1"
        "3, monitor:eDP-1"
        "4, monitor:eDP-1"
        "5, monitor:eDP-1"
        "6, monitor:eDP-1"
        "7, monitor:eDP-1"
        "8, monitor:HDMI-A-1"
      ];

      exec-once = [ "hyprpaper" "dropbox start" ];
    };
  };

  services = {
    hyprpaper = {
      enable = true;
      settings = {
        ipc = false;
        preload = [
          "~/.dotfiles/wallpapers/16.png"
        ];

        wallpaper = [
          "eDP-1,~/.dotfiles/wallpapers/16.png"
        ];
      };
    };
  };

  programs = {
    git = {
      enable = true;
      userName = "Jofr3";
      userEmail = "jofrescari@gmail.com";
      includes = [{
        condition = "gitdir:~/lsw/";
        contents = {
          user.name = "JofreLSW";
          user.email = "jofrelsw@gmail.com";
        };
      }];
    };

    ssh.enable = true;
  };

  systemd.user.startServices = "sd-switch";

  home.enableNixpkgsReleaseCheck = false;
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
