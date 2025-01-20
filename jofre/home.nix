{
  _lib,
  pkgs,
  _inputs,
  ...
}:
let
  myConfig = pkgs.fetchFromGitHub {
    owner = "Jofr3";
    repo = ".dotfiles";
    rev = "e1fc2d53e1c90893e20ab67d895d2f98937d17d1";
    sha256 = "sha256-ThvoHo0qwF7/6dyPKhXPv0kC+NtAMyAy0t6jgOva+Zs=";
  };
in 
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowInsecure = true;
    };
  };

  home = {
    username = "jofre";
    homeDirectory = "/home/jofre";
  };

  home.packages = with pkgs; [
    # cli
    fastfetch
    lazygit
    nix-prefetch-github

    # neovim
    neovim
    zoxide
    eza
    yazi
    docker
    docker-compose
    inetutils

    # apps
    kitty
    chromium
    qutebrowser
    obsidian
    google-chrome
    nautilus
    gnome-randr
    eog
    wl-color-picker
    gnome-calculator
    papers
    gnome-bluetooth
    gnome-screenshot
    dialect
    apostrophe
    errands
    vscode
    dbeaver-bin

    # other
    dmenu-wayland
    wofi
    bitwarden-cli
    rbw
    rofi-rbw
    openconnect
    dropbox-cli

    # dependencies
    git
    gccgo
    zig
    python39
    lua
    luajitPackages.luarocks
    unzip
    wget
    ripgrep
    fd
    rustc
    cargo
    sqlite
    wl-clipboard-rs
    wtype
    pinentry-tty
    openssl
    nodejs_23
    rsync
    gnumake

    # lsp's
    lua-language-server
    nil
    vscode-langservers-extracted
  ];

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "Jofr3";
      userEmail = "jofrescari@gmail.com";
    };

    ssh.enable = true;
  };

  stylix = {
    enable = true;
    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/Jofr3/.dotfiles/refs/heads/main/wallpapers/15.jpg";
      sha256 = "sha256-M1AP2BHZeV3m87qu4JGtzQ97lTzM5KlR6Qhk8jN3vmg=";
    }; 
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    polarity = "dark";
  };

  home.file = {
    ".config/hypr".source = "${myConfig}/config/hypr";
    ".config/kitty".source = "${myConfig}/config/kitty";
    ".config/fish".source = "${myConfig}/config/fish";
    ".config/nvim".source = "${myConfig}/config/nvim";
  };

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "24.05";
}
