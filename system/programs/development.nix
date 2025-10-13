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
    };
  };

  environment = {
    systemPackages = with pkgs; [
      python313
    ];

    variables.JAVA_HOME = "${pkgs.zulu21}/";
  };
}
