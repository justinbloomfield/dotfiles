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
    magit
    swiper
    counsel
    evil
    evil-leader
    company
    geiser
    ess
    haskell-mode
    ghc
    company-ghc
  ]) ++ (with epkgs.melpaPackages; [
    use-package
    base16-theme
    xresources-theme
    circe
    all-the-icons
#    all-the-icons-dired
    nix-mode
    multi-term
    emms
    emms-player-mpv
  ]) ++ (with epkgs.elpaPackages; [
    auctex
    company
    csv-mode
    cl-lib
    ace-window
  ]) ++ [
    pkgs.chibi
    pkgs.libressl
  ])
