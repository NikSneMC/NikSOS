{pkgs, ...}: {
  programs.lazydocker = {
    enable = true;

    package = pkgs.symlinkJoin {
      name = "lazydocker-wrapped";
      paths = [pkgs.lazydocker];
      preferLocalBuild = true;
      nativeBuildInputs = [pkgs.makeWrapper];
      postBuild = ''
        wrapProgram $out/bin/lazydocker \
          --suffix DOCKER_HOST : unix:///run/user/1000/podman/podman.sock
      '';
    };
  };
}
