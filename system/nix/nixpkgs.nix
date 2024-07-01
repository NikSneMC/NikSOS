{
  self,
  ...
}: {
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      # "electron-25.9.0"
      "electron-28.3.3"
      "squid-6.8"
    ];
  };
}
