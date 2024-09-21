{
  lib,
  buildGoModule,
  fetchFromGitHub,
}: buildGoModule rec {
  pname = "spoofDPI";
  version = "0.12.0";

  src = fetchFromGitHub {
    owner = "xvzc";
    repo = "spoofDPI";
    rev = "v${version}";
    sha256 = "sha256-m4fhFhZLuWT1diDlDTmTsNrckKTjhEZbhciv44FZcro=";
  };

  vendorHash = "sha256-47Gt5SI6VXq4+1T0LxFvQoYNk+JqTt3DonDXLfmFBzw=";

  subPackages = [
    "cmd/spoofdpi"
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
