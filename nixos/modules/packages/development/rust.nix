{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    rustup
    cargo
    rustc
    pkg-config
  ];
}
