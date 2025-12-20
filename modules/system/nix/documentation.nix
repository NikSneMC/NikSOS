{
  documentation = {
    doc.enable = false;

    info.enable = false;

    nixos.enable = false;

    man = {
      enable = true;

      generateCaches = true;

      mandoc.enable = false;
    };
  };
}
