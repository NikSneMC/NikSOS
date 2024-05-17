{
  pkgs,
  ...
}: {
  programs = {
    java = {
      enable = true;
      package = pkgs.zulu17;
    };
    direnv = {
      nix-direnv.enable = true;
      enable = true;
    };
  };
  

  environment = {
    systemPackages = with pkgs; [
      zulu8
      zulu11
      zulu21
      
      python311Full
      python312Full

      bun
      nodePackages.pnpm
      sass
      
      fpc

      libgcc
    ];
    variables = {
      JAVA_8_HOME = "${pkgs.zulu8}/";
      JAVA_11_HOME = "${pkgs.zulu11}/";
      JAVA_17_HOME = "${pkgs.zulu17}/";
      JAVA_21_HOME = "${pkgs.zulu21}/";

      PYTHON311_PATH = "${pkgs.python311}/";
      PYTHON312_PATH = "${pkgs.python312}/";

      BUN_PATH = "${pkgs.bun}/";

      GCC_PATH = "${pkgs.libgcc}/";
    };
  };
}