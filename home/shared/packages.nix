{ pkgs, ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowInsecure = true;
    };
  };

  home.packages = with pkgs; [
    # cli
    fastfetch
    lazygit
    nix-prefetch-github
    brightnessctl
    playerctl
    pulseaudio

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
    wezterm
    chromium
    qutebrowser
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

    # other
    dmenu-wayland
    wofi
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
    xdg-desktop-portal-hyprland

    # lsp's
    lua-language-server
    nil
    vscode-langservers-extracted
    typescript
    typescript-language-server
  ];
}
