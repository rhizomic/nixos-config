{ config, pkgs, ... }:

{
  home.username = "rhizomic";
  home.homeDirectory = "/home/rhizomic";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  #xresources.properties = {
  #  "Xcursor.size" = 16;
  #  "Xft.dpi" = 172;
  #};

  # basic configuration of git
  programs.git = {
    enable = true;
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    dmenu

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    fzf # A command-line fuzzy finder

    # misc
    file
    which
    tree
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    btop

    lsof # list open files

    pciutils # lspci
    usbutils # lsusb

    firefox-devedition
    neovim
    tmux
    tmuxp
  ];

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
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
