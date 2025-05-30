{ pkgs, ... }: {
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
    zellij
    btop

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
    eog
    wl-color-picker
    gnome-calculator
    papers
    gnome-text-editor
    wdisplays
    vivaldi
    vscode
    foot
    discord

    # other
    dropbox-cli
    slurp
    grim
    mako
    tofi

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
    fzf

    # lsp's
    lua-language-server
    nil
    vscode-langservers-extracted
    typescript-language-server
    typos-lsp

    # formatters
    stylua
    blade-formatter
    php83Packages.php-cs-fixer
    nixfmt-classic
  ];
}
