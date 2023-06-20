# config import for desktop

{config, pkgs, ... }:

{
  home.packages = with pkgs; [
    vscode
    brave
    obsidian
    signal-desktop
    xfce.xfce4-terminal
    evince
    
    ## fonts
    source-sans-pro
    source-code-pro
    cantarell-fonts
    fira-code 
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
    };
  };
  

  fonts.fontconfig.enable = true; # !run fc-cache -f after installing fonts

}