let
  minimal = [
    ./core/users.nix
    ./nix
    ./programs/fish.nix
    ./programs/home-manager.nix
    ./virtualisation/podman.nix
  ];

  desktop =
    minimal
    ++ [
      ./core
      ./hardware
      ./network
      ./programs
      ./services
      ./virtualisation
    ];

  laptop =
    desktop
    ++ [
      ./hardware/bluetooth.nix
      ./services/power.nix
    ];
in {
  inherit minimal desktop laptop;
}
