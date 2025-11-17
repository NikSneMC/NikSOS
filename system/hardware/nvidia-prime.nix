{inputs, ...}: {
  imports = [
    "${inputs.nixos-hardware}/common/gpu/nvidia/prime.nix"
  ];

  hardware.nvidia.primeBatterySaverSpecialisation = true;
}
