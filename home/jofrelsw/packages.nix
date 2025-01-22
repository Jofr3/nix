{ pkgs, ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowInsecure = true;
    };
  };

  home.packages = with pkgs; [
      vscode
      dbeaver-bin
      openconnect
  ];
}
