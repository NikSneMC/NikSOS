{pkgs, ...}: {
  virtualisation.podman = {
    enable = true;
    autoPrune.enable = true;
    dockerCompat = true;
    dockerSocket.enable = true;
  };

  environment.systemPackages = with pkgs; [
    podman-compose
    kubectl
    kind
    podman-desktop
  ];
}
