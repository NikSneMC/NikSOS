{
  lib,
  pkgs,
  ...
}: let 
  pluginsList = plugins: builtins.listToAttrs (builtins.map (
    plugin: {
      name = plugin; 
      value = { enable = true; };
    })
    plugins
  );
  
  extraPluginsList = extraPlugins: lib.mapAttrsToList (
    name: { owner, repo ? name, rev, hash }: (pkgs.vimUtils.buildVimPlugin {
      name = name;
      src = pkgs.fetchFromGitHub { inherit owner repo rev hash; };
    })
  ) extraPlugins;
in {
  imports = [
    ./barbar.nix
    ./cmp.nix
    ./dashboard.nix
    ./lsp.nix
    ./neo-tree.nix
    ./neocord.nix
    ./project-nvim.nix
    ./refactoring.nix
    ./toggleterm.nix
  ];

  programs.nixvim = {
    plugins = pluginsList [
      "friendly-snippets"
      "gitsigns"
      "indent-blankline"
      "lualine"
      "luasnip"
      "markdown-preview"
      "nix"
      "nix-develop"
      "nvim-autopairs"
      "rainbow-delimiters"
      "telescope"
      "todo-comments"
      "treesitter"
      "wakatime"
      "which-key"
    ];
    extraPlugins = extraPluginsList {
      neotree-file-nesting-config = {
        owner = "saifulapm";
        rev = "d9168eed2522397d271624e5f523d8384a552a64";
        hash = "sha256-qaB60iMLkuN5N9gnAJ2QHFmimlxTnBNlNqv6Zfb3aHg=";
      };
    };
  };
}
