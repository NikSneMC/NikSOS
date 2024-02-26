{ pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
        zulu21
        zulu17
        zulu11
        zulu8
    ];
}