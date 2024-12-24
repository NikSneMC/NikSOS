{niksos, ...}: {
  flake.nixosConfigurations = with niksos.hosts;
    mkHosts {
      table-niksne = systemProfiles.desktop;
      laptop-niksne = systemProfiles.laptop;
      niksos-wsl = systemProfiles.minimal;
    };
}
