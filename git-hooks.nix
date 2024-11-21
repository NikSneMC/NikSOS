{inputs, ...}: {
  imports = [inputs.git-hooks.flakeModule];

  perSystem.pre-commit = {
    settings.excludes = ["flake.lock"];

    settings.hooks = {
      alejandra.enable = true;
      deadnix.enable = true;
    };
  };
}
