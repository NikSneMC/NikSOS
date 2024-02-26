{ pkgs, ... }:

{
    # Fonts
    fonts.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
        corefonts
    ];
}