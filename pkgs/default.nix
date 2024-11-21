{
  systems = ["x86_64-linux"];

  perSystem = {
    pkgs,
    inputs',
    ...
  }: {
    packages = with pkgs; {
      ja-netfilter = callPackage ./ja-netfilter {};
    };
  };
}
