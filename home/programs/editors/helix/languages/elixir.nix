{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "elixir";
          auto-format = true;
        }
      ];
    };

    extraPackages = with pkgs; [
      beamMinimal28Packages.elixir-ls
    ];
  };
}
