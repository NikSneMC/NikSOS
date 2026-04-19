{
  documentation = {
    doc.enable = false;
    info.enable = false;
    nixos.enable = false;

    man = {
      enable = true;
      cache.enable = true;
      mandoc.enable = false;
    };
  };
}
