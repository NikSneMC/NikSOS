{
  lib,
  buildGoModule,
  fetchFromGitHub,
}: buildGoModule rec {
  pname = "spoofDPI";
  version = "0.10.10";

  src = fetchFromGitHub {
    owner = "xvzc";
    repo = "spoofDPI";
    rev = "v${version}";
    sha256 = "sha256-n9GoZP2AxkWWYW4cKpmiKx3v3sLxqVVLu22D3IRcakw=";
  };

  vendorHash = "sha256-sIqkpoaXx+Un1GdOKgPkZnn3/DWCNAcDHqGaw8i6qDk=";

  subPackages = [
    "cmd/spoof-dpi"
  ];

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "A simple and fast anti-censorship tool written in Go";
    homepage = "https://github.com/xvzc/SpoofDPI";
    license = licenses.asl20;
  };
}
