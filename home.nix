{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "bunke";
  home.homeDirectory = "/home/bunke";
  home.packages = [
    pkgs.htop
    pkgs.vim
    pkgs.vscode
    pkgs.terminator
    pkgs.bat
    pkgs.most
  ];

  home.file.".config/terminator/config".source = ./terminator;
  home.file.".config/htop/htoprc".source = ./htoprc;
  home.file.".config/fish/conf.d/nix-env.fish".source = ./nix-env.fish;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  programs.fish = {
    enable = true;
    shellAliases = {
      cp = "cp -v";
      docker = "sudo docker";
      top = "htop";
      cat = "bat --paging=never";
    };
  };

}
