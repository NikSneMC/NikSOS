{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    python311Full
    python312Full 
  ];
}
