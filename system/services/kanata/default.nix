{
  services.kanata = {
    enable = true;

    keyboards.default = {
      extraDefCfg = ''
        process-unmapped-keys yes
      '';
      config = builtins.readFile (./. + "/main.kbd");
    };
  };
}
