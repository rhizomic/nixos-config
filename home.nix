{ config, pkgs, ... }:

{
  home.username = "rhizomic";
  home.homeDirectory = "/home/rhizomic";

  home.file.".config/base16-shell" = {
    source = pkgs.fetchFromGitHub {
      owner = "chriskempson";
      repo = "base16-shell";
      rev = "588691ba71b47e75793ed9edfcfaa058326a6f41";
      sha256 = "X89FsG9QICDw3jZvOCB/KsPBVOLUeE7xN3VCtf0DD3E=";
    };
  };

  home.file.".config/fish" = {
    source = ./dotfiles/.config/fish;
  };

  home.file.".config/nvim" = {
    source = ./dotfiles/.config/nvim;
  };

  home.file.".config/greenclip.toml" = {
    source = ./dotfiles/.config/greenclip.toml;
  };

  home.file.".config/redshift/redshift.conf" = {
    source = ./dotfiles/.config/redshift/redshift.conf;
  };

  home.file.".config/alacritty/alacritty.yml" = {
    source = ./dotfiles/.config/alacritty/alacritty.yml;
  };

  home.file.".xinitrc" = {
    source = ./dotfiles/.xinitrc;
  };

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;

    "Xft.antialias" = 1;
    "Xft.hinting" = 1;
    "Xft.autohint" = 0;
    "Xft.rgba" = "rgb";
    "Xft.hintstyle" = "hintslight";
    "Xft.lcdfilter" = "lcddefault";
  };

  # set cursor theme
  home.pointerCursor = {
    package = pkgs.vanilla-dmz;
    name = "Vanilla-DMZ-AA";
  };

  # packages that should be installed to the user profile
  home.packages = with pkgs; [
    # terminal
    alacritty

    # program launcher
    rofi
    # screenshots
    flameshot
    # git tui
    tig

    # clipboard manager
    haskellPackages.greenclip

    # probably not necessary after moving away from X
    numlockx

    # audio
    pavucontrol
    pulseeffects-legacy
    # all of these are necessary for pulseeffects
    dconf
    lsp-plugins
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    fd # alternative to find
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    fzf # A command-line fuzzy finder

    # misc
    file
    which
    tree
    gnupg

    # system monitoring
    btop

    # list open files
    lsof
    # lspci
    pciutils
    # lsusb
    usbutils

    # browser
    firefox-devedition
    # editor
    neovim

    # get/set contents of the X selection
    xsel

    # terminal multiplexer
    tmux
    # tmux session manager
    tmuxp

    # terminal workspace
    zellij

    # faster terminal navigation
    zoxide

    # programming
    nodejs_20
    ruby
    rubyPackages.pry
    R
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
  };

  # basic configuration of git
  programs.git = {
    enable = true;
    extraConfig = {
      core = {
        # "autocrlf" behavior:
        # ╔═══════════════╦══════════════╦══════════════╦══════════════╗
        # ║ core.autocrlf ║     false    ║     input    ║     true     ║
        # ╠═══════════════╬══════════════╬══════════════╬══════════════╣
        # ║               ║ LF   => LF   ║ LF   => LF   ║ LF   => CRLF ║
        # ║ git checkout  ║ CR   => CR   ║ CR   => CR   ║ CR   => CR   ║
        # ║               ║ CRLF => CRLF ║ CRLF => CRLF ║ CRLF => CRLF ║
        # ╠═══════════════╬══════════════╬══════════════╬══════════════╣
        # ║               ║ LF   => LF   ║ LF   => LF   ║ LF   => LF   ║
        # ║ git commit    ║ CR   => CR   ║ CR   => CR   ║ CR   => CR   ║
        # ║               ║ CRLF => CRLF ║ CRLF => LF   ║ CRLF => LF   ║
        # ╚═══════════════╩══════════════╩══════════════╩══════════════╝
        # Taken from: https://stackoverflow.com/a/41282375
        autocrlf = "input";
        #
        #
        # Use less
        #  -i: Smartcase searching
        #  -+F: Don't quit if one screen (i.e., always use less when running
        #       things like `git diff`)
        pager = "less -i -+F";
      };
    };
    aliases = {
      ci = "commit";
      co = "checkout";
      st = "status";
    };
  };

  # enable fish
  programs.fish.enable = true;

  # configure rofi
  programs.rofi = {
    enable = true;
    theme = "dmenu";
  };

  # Set the default editor to neovim
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # wayland.windowManager.hyprland.extraConfig = ''
  #   $mod = SUPER

  #   bind = $mod, F, exec, firefox
  #   # bind = , Print, exec, grimblast copy area

  #   # workspaces
  #   # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
  #   ${builtins.concatStringsSep "\n" (builtins.genList (
  #       x: let
  #         ws = let
  #           c = (x + 1) / 10;
  #         in
  #           builtins.toString (x + 1 - (c * 10));
  #       in ''
  #         bind = $mod, ${ws}, workspace, ${toString (x + 1)}
  #         bind = $mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}
  #       ''
  #     )
  #     10)}

  #   # ...
  # '';

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
