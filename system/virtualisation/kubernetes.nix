{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    kubectl
    kind
    kubernetes-helm
  ];
}
