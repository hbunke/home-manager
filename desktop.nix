# config import for desktop

{config, pkgs, ... }:

{
  home.packages = [
    pkgs.vscode
    pkgs.brave
    pkgs.obsidian
    pkgs.signal-desktop
    pkgs.xfce.xfce4-terminal
    pkgs.source-sans-pro
    pkgs.source-code-pro
    pkgs.cantarell-fonts
    pkgs.fira-code 
  ];
  

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

  
  
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "Source Code Pro:pixelsize=22";
        dpi-aware = "auto";
        include = "~/.config/foot/themes/onedark";
      };
      scrollback = {
        lines = 10000;
      };
      
    };
  };
  

  fonts.fontconfig.enable = true; # !run fc-cache -f after installing fonts

}