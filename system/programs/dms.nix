{inputs, ...}: {
  imports = [
    inputs.dms.nixosModules.greeter
  ];

  programs.dank-material-shell.greeter = {
    enable = true;

    compositor.name = "niri";

    configHome = "/home/niksne";

    logs = {
      save = true;
      path = "/tmp/dms-greeter.log";
    };
  };
}
