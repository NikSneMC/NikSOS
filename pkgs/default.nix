{
  systems = [ "x86_64-linux" ];

  perSystem = {
    pkgs,
    inputs',
    ...
  }: {
    packages = {
      ja-netfilter = pkgs.callPackage ./ja-netfilter {};
      spoofdpi = pkgs.callPackage ./spoofdpi {};
    };
  };
}
