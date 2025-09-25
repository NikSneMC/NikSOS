{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "javascript";
          auto-format = true;
        }
        {
          name = "jsx";
          auto-format = true;
        }
        {
          name = "typescript";
          auto-format = true;
        }
        {
          name = "tsx";
          auto-format = true;
        }
        {
          name = "svelte";
          auto-format = true;
        }
        {
          name = "vue";
          auto-format = true;
        }
      ];
    };

    extraPackages = with pkgs; [
      nodePackages.vscode-langservers-extracted
      svelte-language-server
      vue-language-server
      astro-language-server
      angular-language-server
    ];
  };
}
