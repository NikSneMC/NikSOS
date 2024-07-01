{
  lib,
  stdenvNoCC,
  fetchzip,
  unzip
}: stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "ja-netfilter";
  version = "240218";

  src = fetchzip {
    url = "https://hardbin.com/ipfs/bafybeiawsvnhqx5o2aqa37pvq7brlk7vqj2cpty3b5xac655bxbpqbpkq4/files/jetbra-ded4f9dc4fcb60294b21669dafa90330f2713ce4.zip";
    hash = "sha256-phc/zFduUOHEA3s3BqfcBeBfKGY2Tc6G/JndeEXz8ms=";
  };

  dontBuild = true;
  dontFixup = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out

    cp ja-netfilter.jar $out

    runHook postInstall
  '';


  meta = {
    description = "Jetbrains IDEs crack";
    homepage = "https://3.jetbra.in";
    platforms = lib.platforms.linux;
  };
})