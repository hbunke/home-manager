# config import for desktop

{config, pkgs, ... }:

{
  ## # for now only source the sway config
  ## switched off since sway config on nixos is different
  # home.file.".config/sway".source = ./config/sway; 

  # source foot themes
  # ? could this be sourced from the original github repo?
  home.file.".config/foot/themes".source = ./config/foot/themes;

  
  home.packages = with pkgs; [
    vscode
    brave
    obsidian
    signal-desktop
    xfce.xfce4-terminal
    evince
    webex
    
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
        font = "Source Code Pro:size=11";
        dpi-aware = "auto";
        include = "~/.config/foot/themes/nord";
      };
      scrollback = {
        lines = 10000;
      };
      
    };
  };
  

  fonts.fontconfig.enable = true; # !run fc-cache -f after installing fonts

}