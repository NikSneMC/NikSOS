{inputs, ...}: {
  imports = [inputs.git-hooks.flakeModule];

  perSystem.pre-commit = {
    settings.excludes = ["flake.lock"];

    settings.hooks = {
      # alejandra.enable = true; FIXME: wait for the pipe operator support
      deadnix.enable = true;
    };
  };
}
