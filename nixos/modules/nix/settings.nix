{ ... }:

{
  nixpkgs.config = {
    # Allow unfree packages
    allowUnfree = true;

    # Allow broken packages
    allowBroken = true;
  };

  # Enable experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
