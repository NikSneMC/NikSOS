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
          ];
        }
        {
          name = "svelte";
          auto-format = true;
          language-servers = [
            "svelteserver"
            "tailwindcss-ls"
          ];
        }
        {
          name = "vue";
          auto-format = true;
          language-servers = [
            "vuels"
            "tailwindcss-ls"
          ];
        }
        {
          name = "astro";
          auto-format = true;
          language-servers = [
            "astro-ls"
            "tailwindcss-ls"
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
                location = "${pkgs.vue-language-server}/lib/node_modules/@vue/language-server";
                languages = ["vue"];
              }
            ];
          };
        };
      };
    };

    extraPackages = with pkgs; [
      nodePackages.vscode-langservers-extracted
      tailwindcss-language-server
      svelte-language-server
      vue-language-server
      astro-language-server
      angular-language-server
    ];
  };
}
