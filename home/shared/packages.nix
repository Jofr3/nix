{ pkgs, ... }:
{
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
}
