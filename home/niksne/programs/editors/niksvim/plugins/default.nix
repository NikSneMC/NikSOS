{
  lib,
  pkgs,
  config,
  ...
}: let 
  mkPluginsList = plugins: builtins.listToAttrs (builtins.map (
    plugin: {
      name = plugin; 
      value = { enable = true; };
    })
    plugins
  );
  
  mkExtraPluginsList = extraPlugins: lib.mapAttrsToList (
    name: { owner, repo ? name, rev, hash, config ? "", optional ? false, ... }: {
      inherit config optional;
      plugin = pkgs.vimUtils.buildVimPlugin {
        name = name;
        src = pkgs.fetchFromGitHub { inherit owner repo rev hash; };
      };
    }
  ) extraPlugins;

  mkExtraPluginsLua = extraPlugins: builtins.concatStringsSep "\n" (lib.mapAttrsToList (
    name: { setup ? name, settings ? {}, ... }: "require('${setup}').setup(${config.lib.nixvim.toLuaObject settings})"
  ) (lib.filterAttrs (k: {activate ? false, ...}: activate) extraPlugins));
in {
  imports = [
    ./barbar.nix
    ./cmp.nix
    ./dashboard.nix
    ./indent-blankline.nix
    ./lsp.nix
    ./lualine.nix
    ./neo-tree.nix
    ./neocord.nix
    ./nvim-colorizer.nix
    ./project-nvim.nix
    ./refactoring.nix
    ./toggleterm.nix
    ./treesitter.nix
  ];

  programs.nixvim = let 
    extraPlugins = {
      neotree-file-nesting-config = {
        owner = "saifulapm";
        rev = "d9168eed2522397d271624e5f523d8384a552a64";
        hash = "sha256-qaB60iMLkuN5N9gnAJ2QHFmimlxTnBNlNqv6Zfb3aHg=";
      };
    };

  in {
    plugins = mkPluginsList [
      "comment"
      "diffview"
      "friendly-snippets"
      "gitsigns"
      "luasnip"
      "markdown-preview"
      "neogit"
      "nix"
      "nix-develop"
      "nvim-autopairs"
      "rainbow-delimiters"
      "rest"
      "telescope"
      "todo-comments"
      "wakatime"
      "which-key"
    ];
    extraPlugins = mkExtraPluginsList extraPlugins;

    extraConfigLua = mkExtraPluginsLua extraPlugins;
  };
}
