{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "bunke";
  home.homeDirectory = "/home/bunke";
  home.packages = [
    pkgs.htop
    #pkgs.vim
    pkgs.vscode
    pkgs.terminator
    pkgs.bat
    pkgs.most
    pkgs.ncdu
    pkgs.sshuttle
    pkgs.tilix
    pkgs.exa
    pkgs.zsh
  ];


  # Variables for all shells (GENIAL!)
  home.sessionVariables = {
    LESS = "-RSM~gIsw";
    PAGER = "most";
    EDITOR = "vim";
    #PATH = $PATH ~/bin;
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    BAT_THEME = "Monokai Extended";
  };

  # Same for aliases
  home.shellAliases = {
    cp = "cp -v";
    docker = "sudo docker";
    ll = "exa -la --color=always | bat";
    ncdu = "ncdu --color dark";
    top = "htop";
  };

  home.sessionPath = [
    "$HOME/bin"
  ];



  home.file.".config/terminator/config".source = ./config/terminator;
  home.file.".config/htop/htoprc".source = ./config/htoprc;
  home.file.".config/fish/conf.d/nix-env.fish".source = ./config/nix-env.fish;
  home.file.".config/fish/functions/fish_prompt.fish".source = ./config/fish_prompt.fish;
  home.file.".config/tilix/schemes".source = ./config/tilix/schemes;
  
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
