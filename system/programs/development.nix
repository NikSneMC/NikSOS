{
  pkgs,
  ...
}: {
  programs = {
    java = {
      enable = true;
      package = pkgs.zulu21;
    };
    direnv = {
      nix-direnv.enable = true;
      enable = true;
    };
  };
  

  environment = {
    systemPackages = with pkgs; [
      zulu8
      zulu17
      zulu21
      
      python312Full

      bun
      nodejs_22
      nodePackages.pnpm
      sass
      
      fpc

      gcc
    ];
    variables = {
      JAVA_8_HOME = "${pkgs.zulu8}/";
      JAVA_17_HOME = "${pkgs.zulu17}/";
      JAVA_21_HOME = "${pkgs.zulu21}/";
      JAVA_HOME = "${pkgs.zulu21}/";

      PYTHON_PATH = "${pkgs.python312Full}/";

      BUN_PATH = "${pkgs.bun}/";
      NODE_PATH = "${pkgs.nodejs_22}/";

      GCC_PATH = "${pkgs.libgcc}/";
    };
  };
}