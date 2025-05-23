{ inputs, lib, config, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;

  networking.networkmanager.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowInsecure = true;
    };
  };

  nix = let flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in { settings = { experimental-features = "nix-command flakes"; }; };

  networking.hostName = "nixos";

  fonts.packages = with pkgs; [ fira-code-nerdfont ];

  environment.systemPackages = with pkgs; [
    python312Packages.qtile
    river
    wayland
    xwayland
    libinput

    home-manager
    fish
    hyprland
    hyprpaper
    kitty
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  users.users = {
    jofre = {
      initialPassword = "1234";
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "docker"
        "networkmanager"
        "video"
        "audio"
        "input"
        "render"
        "dialout"
        "plugdev"
        "adbusers"
        "kvm"
      ];
    };
  };

  users.groups = {
    docker = { };
    plugdev = { };
  };

  services.udev.packages = [ pkgs.android-udev-rules ];

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="12d1", MODE="0666", GROUP="plugdev"
  '';

  services.udev.enable = true; # Ensure udev service is enabled

  virtualisation.docker.enable = true;

  time.timeZone = "Europe/Madrid";
  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.enable = true;
  services.displayManager.enable = true;
  services.displayManager.ly.enable = true;

  services.dbus.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.flatpak.enable = true;

  environment.sessionVariables = { NIXOS_OZONE_WL = "1"; };

  hardware = {
    graphics = {
      enable = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [ intel-media-driver vaapiIntel ];
    };
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };

  boot.kernelParams = lib.mkIf (config.hardware.intelgpu.driver == "i915")
    [ "i915.enable_guc=3" ];
  hardware.intelgpu.vaapiDriver = "intel-media-driver";

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      hr-remote = "home-manager switch --flake github:Jofr3/nix#jofre@nixos";
    };
  };

  users.defaultUserShell = pkgs.fish;

  stylix = {
    enable = true;
    image = ../theme/wallpaper.jpg;
    base16Scheme = ../theme/gruvbox.yml;
    cursor.size = 24;
    polarity = "dark";
  };

  system.stateVersion = "25.05";
}
