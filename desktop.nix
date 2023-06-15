# config import for desktop

{config, pkgs, ... }:

{
  home.packages = [
    pkgs.vscode
    pkgs.brave
    pkgs.obsidian
    pkgs.terminator
    pkgs.tilix
    pkgs.source-sans-pro
    pkgs.source-code-pro
    pkgs.cantarell-fonts
    pkgs.fira-code 
  ];

  home.file.".config/terminator/config".source = ./config/terminator;
  home.file.".config/tilix/schemes".source = ./config/tilix/schemes;

  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 13.0;
      font.normal.family = "Source Code Pro";
      import = [
        "~/.config/alacritty/themes/themes/dark_pastels.yaml"
      ];
    };
  };

  fonts.fontconfig.enable = true; # !run fc-cache -f after installing fonts

}