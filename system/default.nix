let
  minimal = [
    ./core/users.nix
    ./nix
    ./programs/fish.nix
    ./programs/home-manager.nix
  ];

  desktop = minimal ++ [
    ./core
    ./hardware
    ./network
    ./programs
    ./services
  ];

  laptop = desktop ++ [
    ./hardware/bluetooth.nix
    ./services/power.nix
  ];
in {
  inherit minimal desktop laptop;
}
