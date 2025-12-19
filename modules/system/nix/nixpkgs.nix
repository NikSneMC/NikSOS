{
  nixpkgs.config = {
    allowBroken = false;
    allowUnsupportedSystem = true;
    allowUnfree = true;
    permittedInsecurePackages = [];
    allowAliases = false;
    enableParallelBuildingByDefault = false;
    showDerivationWarnings = [];
  };
}
