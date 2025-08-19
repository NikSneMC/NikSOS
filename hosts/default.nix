{niksos, ...}: {
  flake.nixosConfigurations = let
    inherit (niksos.hosts) mkHosts systemProfiles;
  in
    mkHosts {
      konran = systemProfiles.desktop;
      nakama = systemProfiles.laptop;
      tobichi = systemProfiles.minimal;
    };
}
