{
  programs.nixvim.plugins.indent-blankline = {
    enable = true;
    settings.exclude.filetypes = [
      "checkhealth"
      "dashboard"
      "gitcommit"
      "help"
      "lspinfo"
      "man"
      "packer"
      "TelescopePrompt"
      "TelescopeResults"
      "''"
    ];
  };
}
