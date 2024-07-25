{
  description = "NikSne's NixOS and Home-Manager flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    nikspkgs.url = "github:NikSneMC/NikSpkgs";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hm = {
      url = "github:NikSneMC/home-manager/NikSneMC-patch-1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprcursor.url = "github:hyprwm/hyprcursor";
    hyprpaper.url = "github:hyprwm/hyprpaper";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hypridle.url = "github:hyprwm/hypridle";
    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:NikSneMC/catppuccin-nix";

    nix-minecraft.url = "github:NiKSneMC/nix-minecraft";
    nix-python.url = "github:NiKSneMC/nix-python";

    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    anyrun.url = "github:anyrun-org/anyrun";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
       url = "github:the-argus/spicetify-nix";
       inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin-catwalk.url = "github:catppuccin/catwalk";
    catppuccin-whiskers.url = "github:catppuccin/whiskers";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      imports = [
        ./home/profiles.nix
        ./hosts
        ./modules
        ./pkgs
      ];

      perSystem = {
        config,
        pkgs,
        ...
      }: {
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.git
          ];
          name = "dots";
          DIRENV_LOG_FORMAT = "";
        };
      };
    };
}
