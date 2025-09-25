{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "c";
          auto-format = true;
        }
        {
          name = "cpp";
          auto-format = true;
        }
      ];
    };

    extraPackages = with pkgs; [
      llvmPackages_21.clang-tools
    ];
  };
}
