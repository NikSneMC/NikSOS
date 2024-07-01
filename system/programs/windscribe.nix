{
  npkgs,
  ...
}: {
  environment.systemPackages = with npkgs; [
    windscribe
  ];
}