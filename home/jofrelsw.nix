{ pkgs, ... }:
{
  imports = [
    ../home/shared/packages.nix
    ../home/shared/stylix.nix
    ../home/shared/configs.nix
    ../home/shared/other.nix
  ];

  home = {
    username = "jofrelsw";
    homeDirectory = "/home/jofrelsw";

    packages = with pkgs; [
      vscode
      dbeaver-bin
      openconnect
    ];
  };

  programs = {
    git = {
      enable = true;
      userName = "JofreLSW";
      userEmail = "jofrelsw@gmail.com";
    };

    ssh.enable = true;
  };
  
  # systemd.user.services.vpn_service = {
  #   Unit = {
  #     Description = "vpn service";
  #     After = [ "default.target" ];
  #   };

  #   Service = {
  #     ExecStart = "${pkgs.writeScript "startup-script" ''
  #       #!${pkgs.bash}/bin/bash
  #       # Your commands here
  #       touch /home/jofre/test
  #     ''}";
  #     
  #     Restart = "on-failure";
  #   };

  #   Install = {
  #     WantedBy = [ "default.target" ]; 
  #   };
  # };

  home.stateVersion = "24.05";
}
