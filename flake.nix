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

    private = {
      url = "github:NikSneMC/NikSOS-private";
      flake = false;
    };

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

    ayugram-desktop.url = "github:/ndfined-crp/ayugram-desktop/release?submodules=1";

    git-helper = {
      url = "github:NiKSneMC/git-helper";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
        fenix.follows = "fenix";
        naersk.follows = "naersk";
      };
    };

    nix-minecraft = {
      url = "github:Infinidoge/nix-minecraft";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
        flake-compat.follows = "flake-compat";
      };
    };
    nix-python = {
      url = "github:NiKSneMC/nix-python";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
        flake-compat.follows = "flake-compat";
      };
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-compat.follows = "flake-compat";
      };
    };

    niksvim = {
      url = "github:NikSneMC/NikSVim";
      inputs = {
        systems.follows = "systems";
        nixpkgs.follows = "nixpkgs";
        flake-compat.follows = "flake-compat";
        flake-parts.follows = "flake-parts";
        flake-utils.follows = "flake-utils";
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

    vscode-file-nesting-config-json = {
      url = "github:NikSneMC/vscode-file-nesting-config-json";
      flake = false;
    };

    waybar.url = "github:Alexays/Waybar";

    zjstatus = {
      url = "github:dj95/zjstatus";
    };

    zen-browser = {
      url = "github:NikSneMC/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
