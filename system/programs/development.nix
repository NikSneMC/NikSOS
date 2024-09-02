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
      python312Full
    ];

    variables.JAVA_HOME = "${pkgs.zulu21}/";
  };
}
