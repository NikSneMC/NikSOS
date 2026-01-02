{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "typst";
          auto-format = true;
        }
      ];

      language-server.tinymist = {
        config = {
          exportPdf = "onType";
          lint.enabled = true;
          preview.background.enabled = true;
          outputPath = "$root/target/$dir/$name";
          formatterMode = "typstyle";
          formatterPrintWidth = 80;
        };
      };
    };

    extraPackages = with pkgs; [
      tinymist
      typstyle
    ];
  };
}
