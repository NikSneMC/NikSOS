{
  lib,
  pkgs,
  config,
  ...
}: let
  mkPluginsList = plugins:
    lib.pipe plugins [
      (builtins.map (plugin: lib.nameValuePair plugin {enable = true;}))
      builtins.listToAttrs
    ];

  mkExtraPluginsList = lib.mapAttrsToList (
    name: {
      package ? null,
      owner ? null,
      repo ? name,
      rev ? null,
      hash ? null,
      config ? "",
      optional ? false,
      ...
    }: {
      inherit config optional;
      plugin =
        if package != null
        then package
        else
          pkgs.vimUtils.buildVimPlugin {
            name = name;
            src = pkgs.fetchFromGitHub {inherit owner repo rev hash;};
          };
    }
  );

  mkExtraPluginsLua = extraPlugins:
    lib.pipe extraPlugins [
      (lib.filterAttrs (_: {activate ? false, ...}: activate))
      (lib.mapAttrsToList (
        name: {
          setup ? name,
          settings ? {},
          ...
        }: "require('${setup}').setup(${config.lib.nixvim.toLuaObject settings})"
      ))
      (builtins.concatStringsSep "\n")
    ];
in {
  imports = [
    ./barbar.nix
    ./better-escape.nix
    ./cmp.nix
    ./dap.nix
    ./dashboard.nix
    ./indent-blankline.nix
    ./lsp.nix
    ./lualine.nix
    ./multicursors.nix
    ./neo-tree.nix
    ./neocord.nix
    ./neotest.nix
    ./nvim-colorizer.nix
    ./project-nvim.nix
    ./refactoring.nix
    ./telescope.nix
    ./toggleterm.nix
    ./treesitter.nix
    ./which-key.nix
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
      "direnv"
      "emmet"
      "friendly-snippets"
      "git-conflict"
      "gitblame"
      "gitlinker"
      "gitmessenger"
      "gitsigns"
      "luasnip"
      "markdown-preview"
      "neogit"
      "nix"
      "nix-develop"
      "nvim-autopairs"
      "nvim-surround"
      "rainbow-delimiters"
      "rest"
      "todo-comments"
      "ts-autotag"
      "wakatime"
      "web-devicons"
    ];
    extraPlugins = mkExtraPluginsList extraPlugins;

    extraConfigLua = mkExtraPluginsLua extraPlugins;
  };
}
