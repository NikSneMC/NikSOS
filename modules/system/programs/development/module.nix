{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.modules.programs.development;
in {
  options.modules.programs.development = {
    enable = mkEnableOption "development programs module";
  };

  config = mkIf cfg.enable {
    programs = {
      java = {
        enable = true;
        package = pkgs.zulu21;
      };
      direnv = {
        enable = true;
        silent = true;
        nix-direnv.enable = true;
        settings = {
          global = {
            load_dotenv = true;
          };
        };
      };
    };

    environment = {
      systemPackages = with pkgs; [
        python313
      ];

      variables.JAVA_HOME = "${pkgs.zulu21}/";
    };
  };
}
