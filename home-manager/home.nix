{config, pkgs, nixvim, inputs, ... }:
{
  imports = [
  	./nvim.nix
	  ./starship.nix
  ];

  home.username = "spas";
  home.homeDirectory = "/home/spas";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = [
    pkgs.rustup
    pkgs.lua
    pkgs.khal
  ];
    
  accounts.calendar.accounts.spas.khal.enable = true;

  home.file.".config/qtile" = {
    source = ./qtile;
    recursive = true;
    #onChange = home-manager switch;
  };

  home.file.".config/Thunar/uca.xml" = {
    source = ./Thunar/uca.xml;
    #onChange = home-manager switch;
  };

  programs.nushell = {
    enable = true;
    environmentVariables = {
      EDITOR = "nvim";
    };
    extraConfig = ''
      ${builtins.readFile ./nushell/config.nu}
      '';
    extraEnv = ''
      ${builtins.readFile ./nushell/env.nu}
      '';
  };

  programs.kitty = {
    enable = true;
    extraConfig = ''
      ${builtins.readFile ./kitty/kitty.conf}
      '';
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
