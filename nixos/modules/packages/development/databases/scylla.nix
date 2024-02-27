{
  lib,
  fetchFromGitHub,
  python3Packages,
  pkg-config,
  gcc8Stdenv,
  boost,
  git,
  systemd,
  gnutls,
  cmake,
  makeWrapper,
  ninja,
  ragel,
  hwloc,
  jsoncpp,
  antlr3,
  numactl,
  protobuf,
  cryptopp,
  libxfs,
  yaml-cpp,
  libsystemtap,
  lksctp-tools,
  lz4,
  libxml2,
  zlib,
  libpciaccess,
  snappy,
  libtool,
  thrift
}:
gcc8Stdenv.mkDerivation {
  pname = "scylladb";
  version = "3.0.5";

  src = fetchFromGitHub {
    owner = "scylladb";
    repo = "scylladb";
    rev = "fd32e2ee103acaa54cc7362b64eccd6a7f6aaf38";
    hash = "sha256-EZXIHUFjo/GvqkGrAgQRI53Aovp+V/9ytH2jJ7dJxoY=";
    fetchSubmodules = true;
  };

  patches = [ ./seastar-configure-script-paths.patch ./configure-etc-osrelease.patch ];

  nativeBuildInputs = [
   pkg-config
   cmake
   makeWrapper
   ninja
  ];

  buildInputs = [
   antlr3
   python3Packages.pyparsing
   boost
   git
   systemd
   gnutls
   ragel
   jsoncpp
   numactl
   protobuf
   cryptopp
   libxfs
   yaml-cpp
   libsystemtap
   lksctp-tools
   lz4
   libxml2
   zlib
   libpciaccess
   snappy
   libtool
   thrift
  ];

  postPatch = ''
    patchShebangs ./configure.py
    patchShebangs seastar/json/json2code.py
  '';

  configurePhase = ''
    ./configure.py --mode=release
  '';

  installPhase = ''
    mkdir $out
    cp -r * $out/
  '';

  requiredSystemFeatures = [ "big-parallel" ];

  meta = with lib; {
    description = "NoSQL data store using the seastar framework, compatible with Apache Cassandra";
    homepage = "https://scylladb.com";
    license = licenses.agpl3;
    platforms = lib.platforms.linux;
    hydraPlatforms = []; # It's huge ATM, about 18 GB.
    maintainers = [ lib.maintainers.farlion ];
  };
}