{
  description = "NikSne's NixOS and Home-Manager flake";

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      imports = [
        ./home/profiles
        ./hosts
        ./lib
        ./modules
        ./git-hooks.nix
      ];

      perSystem = {
        config,
        pkgs,
        ...
      }:
        with pkgs; {
          devShells.default = mkShell {
            name = "niksos";
            DIRENV_LOG_FORMAT = "";

            packages = [
              alejandra
              deadnix
              git
            ];

            shellHook = ''
              ${config.pre-commit.installationScript}
            '';
          };

          formatter = alejandra;
        };
    };

  inputs = {
    # important
    master.url = "github:NixOS/nixpkgs/master";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    stable.url = "github:NixOS/nixpkgs/nixos-25.05";

    nixpkgs.follows = "unstable";
    nikspkgs.url = "github:NikSneMC/NikSpkgs/niksos";

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    assets = {
      url = "github:NikSneMC/NikSOS/assets";
      flake = false;
    };

    systems.url = "github:nix-systems/default-linux";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };

    flake-compat.url = "github:edolstra/flake-compat";

    private = {
      url = "github:NikSneMC/NikSOS-private";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
        flake-compat.follows = "flake-parts";
        flake-utils.follows = "flake-utils";
      };
    };

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-compat.follows = "flake-compat";
      };
    };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    naersk = {
      url = "github:nix-community/naersk";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        fenix.follows = "fenix";
      };
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        darwin.follows = "";
        home-manager.follows = "hm";
        systems.follows = "systems";
      };
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:NikSneMC/catppuccin-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # common
    activate-niksos = {
      url = "github:NikSneMC/activate-niksos";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        fenix.follows = "fenix";
        naersk.follows = "naersk";
      };
    };

    danksearch = {
      url = "github:NikSneMC/danksearch/fix/distro/nix/package-option";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    discord-rpc-lsp = {
      url = "gitlab:invra/discord-rpc-lsp";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    git-helper = {
      url = "github:NiKSneMC/git-helper";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
        fenix.follows = "fenix";
        naersk.follows = "naersk";
      };
    };

    helix.url = "github:helix-editor/helix";

    nixos-avf = {
      url = "github:NikSneMC/nixos-avf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-compat.follows = "flake-compat";
      };
    };

    niri-flake.url = "github:sodiboo/niri-flake";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    wakatime-ls.url = "github:mrnossiom/wakatime-ls";

    zen-browser = {
      url = "github:NikSneMC/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
