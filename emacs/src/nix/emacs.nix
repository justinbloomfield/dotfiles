/*
 * nix expression for emacs and some useful shit
 * add to configuration.nix
 *
 */
{ pkgs ? import <nixpkgs> {} }:

let
  myEmacs = pkgs.emacs;
  emacsWithPackages = (pkgs.emacsPackagesNgGen myEmacs).emacsWithPackages;
in
  emacsWithPackages (epkgs: (with epkgs.melpaStablePackages; [
    company
    company-ghc
    counsel
    ess
    ghc
    haskell-mode
    magit
    swiper
  ]) ++ (with epkgs.melpaPackages; [
    all-the-icons
    all-the-icons-dired
    base16-theme
    cdlatex
    circe
    emms
    emms-player-mpv
    evil-escape
    geiser
    intero
    multi-term
    neotree
    nix-mode
    pretty-mode
    simple-mpc
#    slime
    slime-company
    spacegray-theme
    stumpwm-mode
    sublime-themes
    use-package
  ]) ++ (with epkgs.elpaPackages; [
    ace-window
    auctex
    cl-lib
    company
    csv-mode
    exwm
  ]) ++ [
    pkgs.chibi
    pkgs.isync
    pkgs.libressl
    pkgs.mu
  ])
