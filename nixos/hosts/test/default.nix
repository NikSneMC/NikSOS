{
    imports = [
        ./hardware-configuration.nix
        ../../modules
    ];
    networking.hostName = "host"; # Define your hostname.
}
