{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "css";
          language-servers = [
            "vscode-css-language-server"
            "tailwindcss-ls"
          ];
        }
        {
          name = "html";
          language-servers = [
            "vscode-html-language-server"
            "tailwindcss-ls"
            "emmet"
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
            "typescript-language-server"
            "tailwindcss-ls"
            "emmet"
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
            "typescript-language-server"
            "tailwindcss-ls"
            "emmet"
          ];
        }
        {
          name = "svelte";
          auto-format = true;
          language-servers = [
            "svelteserver"
            "tailwindcss-ls"
            "emmet"
          ];
        }
        {
          name = "vue";
          auto-format = true;
          language-servers = [
            "vscode-html-language-server"
            "typescript-language-server"
            "tailwindcss-ls"
            "emmet"
          ];
        }
        {
          name = "astro";
          auto-format = true;
          language-servers = [
            "astro-ls"
            "tailwindcss-ls"
            "emmet"
          ];
        }
      ];

      language-server = {
        typescript-language-server = {
          config = {
            typescript-language-server.source = {
              addMissingImports.ts = true;
              fixAll.ts = true;
              organizeImports.ts = true;
              removeUnusedImports.ts = true;
              sortImports.ts = true;
            };
            plugins = [
              {
                name = "@vue/typescript-plugin";
                location = "${pkgs.vue-language-server}/lib/language-tools/packages/language-server";
                languages = ["vue"];
              }
            ];
          };
        };

        emmet = {
          command = "emmet-language-server";
          args = ["--stdio"];
        };
      };
    };

    extraPackages = with pkgs; [
      vscode-langservers-extracted
      tailwindcss-language-server
      emmet-language-server
      typescript-language-server
      svelte-language-server
      vue-language-server
      astro-language-server
      angular-language-server
    ];
  };
}
