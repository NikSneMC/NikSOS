{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "protobuf";
          auto-format = true;
        }
      ];
    };

    extraPackages = with pkgs; [
      protols
    ];
  };
}
