{
  lib,
  buildGoModule,
  fetchFromGitHub,
}: buildGoModule rec {
  pname = "spoofDPI";
  version = "0.10.4";

  src = fetchFromGitHub {
    owner = "xvzc";
    repo = "spoofDPI";
    rev = "v${version}";
    sha256 = "sha256-I93XhIrdCXmoiG6u617toFaB1YALMK8jabCGTp3u4os=";
  };

  vendorHash = "sha256-kmp+8MMV1AHaSvLnvYL17USuv7xa3NnsCyCbqq9TvYE=";

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