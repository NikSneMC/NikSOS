{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "css";
          language-servers = [
            "tailwindcss-ls"
            "vscode-css-language-server"
          ];
        }
        {
          name = "html";
          language-servers = [
            "tailwindcss-ls"
            "emmet"
            "vscode-html-language-server"
          ];
        }
        {
          name = "javascript";
          auto-format = true;
        }
        {
          name = "jsx";
          auto-format = true;
          language-servers = [
            "tailwindcss-ls"
            "emmet"
            "typescript-language-server"
          ];
        }
        {
          name = "typescript";
          auto-format = true;
        }
        {
          name = "tsx";
          auto-format = true;
          language-servers = [
            "tailwindcss-ls"
            "emmet"
            "typescript-language-server"
          ];
        }
        {
          name = "svelte";
          auto-format = true;
          language-servers = [
            "emmet"
            "tailwindcss-ls"
            "svelteserver"
          ];
        }
        {
          name = "astro";
          auto-format = true;
          language-servers = [
            "emmet"
            "tailwindcss-ls"
            "astro-ls"
          ];
        }
      ];

      language-server = {
        emmet = {
          command = "emmet-language-server";
          args = ["--stdio"];
        };

        typescript-language-server = {
          config = {
            typescript-language-server.source = {
              addMissingImports.ts = true;
              fixAll.ts = true;
              organizeImports.ts = true;
              removeUnusedImports.ts = true;
              sortImports.ts = true;
            };
          };
        };
      };
    };

    extraPackages = with pkgs; [
      vscode-langservers-extracted
      tailwindcss-language-server
      emmet-language-server
      typescript-language-server
      svelte-language-server
      astro-language-server
    ];
  };
}
