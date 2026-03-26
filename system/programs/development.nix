{pkgs, ...}: {
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
      python3
      nodejs
    ];

    variables.JAVA_HOME = "${pkgs.zulu25}/";
  };
}
