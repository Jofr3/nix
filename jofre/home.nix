{
  lib,
  pkgs,
  _inputs,
  ...
}:
let
  myConfig = pkgs.fetchFromGitHub {
    owner = "Jofr3";
    repo = ".dotfiles";
    rev = "main";
    sha256 = "62bb2ff8b27858fad838c89662eda871bde9f7fe";
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
    image = ./../../wallpapers/15.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    polarity = "dark";
  };

  home.file.".config/nvim".source = "${myConfig}/nvim";

  home.activation = {
    cloneDotfiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
      if [ ! -d "$HOME/dotfiles" ]; then
        ${pkgs.git}/bin/git clone https://github.com/Jofr3/.dotfiles.git "$HOME/.dotfiles"
      fi
    '';
  };

  imports = [
    ../config/hyprland
  ];

  systemd.user.startServices = "sd-switch";
  home.stateVersion = "24.05";
}
