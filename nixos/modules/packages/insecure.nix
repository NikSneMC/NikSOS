{ ... }:

{
    nixpkgs.config.permittedInsecurePackages = [
        "electron-25.9.0"
        "thrift-0.10.0"
    ];
}
