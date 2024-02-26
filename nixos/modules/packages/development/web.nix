{ pkgs, ...}:

{
    environment.systemPackages = with pkgs; [  
        nodejs_21
    ];
}
