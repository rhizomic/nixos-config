# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

# { config, pkgs, hyprland, ... }:
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Enable Flakes and the new CLI tool
  nix.settings.experimental-features = ["nix-command" "flakes" ];

  # Bootloader.
  # boot.loader.grub.enable = true;
  # boot.loader.grub.device = "/dev/nvme0n1";
  # boot.loader.grub.useOSProber = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rhizomic = {
    isNormalUser = true;
    description = "rhizomic";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];

    # Set fish to be the default shell
    shell = pkgs.fish;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Flakes use git to pull dependencies
    git
    vim
    wget
    curl
    keyd
  ];

  # X configuration that would normally live in an .xinitrc
  environment.extraInit = ''
    xsetroot -cursor_name left_ptr
    xset -dpms
    xset s noblank
    xset s off
    xset r rate 220 60
  '';

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh = {
  #   enable = true;
  #   settings = {
  #     X11Forwarding = true;
  #     PermitRootLogin = "yes";
  #     PasswordAuthentication = true;
  #   };
  #   openFirewall = true;
  # };

  services.keyd = {
    enable = true;
    keyboards.default = {
      settings.main = {
        # Maps capslock to escape.
        capslock = "esc";
        # Remaps the escape key to capslock.
        esc = "capslock";
      };
    };
  };

  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;

  services.xserver.windowManager.xmonad = {
     config = builtins.readFile ./xmonad.hs;
     enable = true;
     enableContribAndExtras = true;
     flake = {
       enable = true;
     # prefix = "unstable";
       compiler = "ghc924";
     };
   };

  # programs.hyprland.enable = true;
  # programs.sway.enable = true;

  # Vendor fish completions provided by Nixpkgs
  programs.fish.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
