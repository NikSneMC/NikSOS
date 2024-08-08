{
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-28.3.3"
      "squid-6.8"
    ];
  };
}
