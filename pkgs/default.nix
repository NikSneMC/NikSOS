{
  systems = ["x86_64-linux"];

  perSystem = {pkgs, ...}: {
    packages = with pkgs; {
      ja-netfilter = callPackage ./ja-netfilter {};
    };
  };
}
