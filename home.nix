# core config for all machines

{ config, pkgs, ... }:

{
  imports = if builtins.getEnv "DESKTOP_SESSION" != ""
    then [ ./desktop.nix ]
    else [ ];

  home.username = "bunke";
  home.homeDirectory = "/home/bunke";
  home.packages = with pkgs; [
    htop
    bat
    most
    ncdu
    #sshuttle
    exa
    zsh
    neofetch
    duf
  ];

  # Variables for all shells (GENIAL!)
  home.sessionVariables = {
    LESS = "-RSM~gIsw";
    PAGER = "most";
    EDITOR = "vim";
    #PATH = $PATH ~/bin;
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    BAT_THEME = "Nord";
  };

  # Same for aliases
  home.shellAliases = {
    cp = "cp -v";
    docker = "sudo docker";
    ll = "exa -la --color=always | bat";
    ncdu = "ncdu --color dark";
    top = "htop";
    duf = "duf -hide special";
  };

  # additional dirs for PATH
  home.sessionPath = [
    "$HOME/bin"
  ];


  home.file.".config/htop/htoprc".source = ./config/htoprc;
  home.file.".config/fish/conf.d/nix-env.fish".source = ./config/nix-env.fish;
  home.file.".config/fish/functions/fish_prompt.fish".source = ./config/fish_prompt.fish;
      
  # TODO: configure zsh and vim with home-manager options
  home.file.".zshrc".source = ./config/zshrc;
  home.file.".vim".source = ./config/vim;


  
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
    shellInit = ''
      set -g fish_greeting
    '';
    # variables and aliases set by home.shellVariables and home.shellAliases for all shells    
  };


  programs.vim = {
    enable  = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      nerdtree
      vim-nerdtree-tabs
      vim-airline
      vim-airline-themes
      vim-colorschemes
      vim-nix
      vim-fugitive
      nginx-vim
      swayconfig-vim
      everforest
    ];
    settings = {
      background = "dark";
      mouse = "a";
      shiftwidth = 4;
      expandtab = true;
      tabstop = 4;
    };
  };
  

}
