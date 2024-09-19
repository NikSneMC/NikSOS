{
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-28.3.3"
    ];
  };
}
