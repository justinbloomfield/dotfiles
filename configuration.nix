# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #boot.loader.grub.device = "/dev/sdd";
  networking.hostName = "invoker"; # Define your hostname.
  networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant.

  # cores for nix-build
  nix.buildCores = 12;

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "dvorak";
    defaultLocale = "en_AU.UTF-8";
    inputMethod.enabled = "ibus";
    inputMethod.ibus.engines = with pkgs.ibus-engines; [ anthy mozc ];
  };

  # Set your time zone.
  time.timeZone = "Australia/Canberra";

  hardware = {
    pulseaudio.enable = true;
    pulseaudio.package = pkgs.pulseaudioFull;
    pulseaudio.extraConfig = ''
    load-module module-jack-sink
    load-module module-jack-source
    '';
    pulseaudio.support32Bit = true;
    opengl.driSupport32Bit = true;
  };
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    R
    acpid
    bc 
    binutils
    blender
    cabal2nix
    chez
    clisp-tip
    cwm
    dtach
    dunst
    easytag
    ed
    ffmpeg
    firefox
    gcc
    gdb
    ghostscript
    gimp
    git-hub
    haskellPackages.cabal-install
    haskellPackages.ghc
    haskellPackages.stack
    haskellPackages.xmobar
    haskellPackages.xmonad
    haskellPackages.xmonad-contrib
    haskellPackages.xmonad-extras
    i7z
    irssi
    isync
    bar-xft
    libnotify
    libreoffice
    lispPackages.quicklisp
    lm_sensors
    mg
    mpc_cli
    mpd
    mpv
    msmtp
    mu
    mutt
    ncmpcpp
    neovim
    newsbeuter-dev
    nix
    nix-prefetch-scripts
    nix-repl
    obs-studio
    pavucontrol
    powertop
    psmisc
    python2
    python3
    qemu
    redshift
    rofi
    rtv
    rxvt_unicode
    scrot
    steam
    sxiv
    telnet
    texlive.combined.scheme-full
    unzip
    w3m
    wget
    windowmaker
    wine
    xclip
    xfontsel
    xlsfonts
    xcape
    xsel
    zathura
    zlib
    zsh
#    noxtag

    #fonts
    font-awesome-ttf
    overpass
    #nixpkgs

#    (pkgs.lib.overrideDerivation pkgs.xst  (attrs: {
#      configFile = builtins.readFile /home/poq/src/pkg/xst/src/config.h;
#    }))
         
#    (pkgs.lib.overrideDerivation pkgs."2bwm" (attrs: {
#      patches = [ /home/poq/src/pkg/2bwm/memes.patch ];
#      src = /home/poq/src/pkg/2bwm;
#    }))

    (import /home/poq/src/nix/emacs.nix { inherit pkgs; })

    (pkgs.lib.overrideDerivation pkgs.dvtm (attrs: {
      name = "dvtm-custom";
      src = /home/poq/src/pkg/dvtm;
    }))
    
#    (pkgs.lib.overrideDerivation pkgs.ii (attrs: {
#      name = "ii-ssl";
#      src = /home/poq/src/pkg/ii-1.7;
#    }))

  ];

  nixpkgs.config = {
    allowUnfree = true;
    xst.conf = builtins.readFile /home/poq/src/pkg/xst/src/config.h;
  };

  # List services that you want to enable:

  services = {
    xserver = {
	   enable = true;
#       autorun = false;
	   videoDrivers = ["nvidia"];
	   layout = "us";
	   xkbVariant = "dvorak";
       xkbOptions = "ctrl:nocaps";
       screenSection =''
         Option "metamodes" "1920x1080_144 +0+0"
       '';
 #      windowManager."2bwm".enable = true;
 #       windowManager.herbstluftwm.enable = true;
       windowManager.xmonad.enable = true;
       windowManager.xmonad.enableContribAndExtras = true;
#       windowManager.default = "xmonad";
       desktopManager.xterm.enable = false;
	   desktopManager.default = "none";

    };
    openssh.enable = true;
    openssh.forwardX11 = true;
    dbus.enable = true;
    acpid.enable = true;
    gpm.enable = true;
    urxvtd.enable = true;

    mpd = {
       enable = true;
       dbFile = "/var/lib/mpd/database";
       dataDir = "/var/lib/mpd/";
       musicDirectory = "/mnt/exthdd/Music";
       extraConfig =
       ''
          audio_output {
             type "pulse"
             name "Local MPD"
             server "127.0.0.1"
          }
       '';

   };

  };

  programs = {
   # ssh.forwardX11 = true; 
    ibus.enable = true;
    adb.enable = true;
  };

  fonts = {
    enableDefaultFonts = true;
    fontconfig.enable = true;
  };
  
  powerManagement.enable = true;
#  virtualisation = {
 #   libvirtd = {
  #     enable = true;
   #    enableKVM = true;
#       qemuVerbatimConfig =
#         ''
#         namespaces = []
#         nvram = [
#	     "/usr/share/ovmf/x64/ovmf_x64.bin:/usr/share/ovmf/x64/ovmf_vars_x64.bin"
#         ]
#         ''
    #    };
  
 # };

 # boot.kernelModules = [
 #   "vfio"
 #   "vfio_pci"
 #   "vfio_iommu_type1"
 # ];
  
  #boot.kernelParams = [
   # "intel_iommu=on"
    #"vfio_iommu_type1.allow_unsafe_interrupts=1"
   # "kvm.allow_unsafe_assigned_interrupts=1"
   # "kvm.ignore_msrs=1"
  #];

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.poq = {
    name = "poq";
    group = "users";
    extraGroups = [
        "wheel" "disk" "audio" "video" "systemd-journal" "adbusers"
    ];
    createHome = true;
    uid = 1000;
    home = "/home/poq";
    shell = "/run/current-system/sw/bin/zsh";
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "unstable";

}

#with import <nixpkgs> {};

