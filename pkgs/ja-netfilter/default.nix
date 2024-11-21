{
  stdenvNoCC,
  fetchzip,
}:
stdenvNoCC.mkDerivation (_: {
  pname = "ja-netfilter";
  version = "240701";

  src = fetchzip {
    url = "https://ipfs.io/ipfs/bafybeih65no5dklpqfe346wyeiak6wzemv5d7z2ya7nssdgwdz4xrmdu6i/files/jetbra-8f6785eac5e6e7e8b20e6174dd28bb19d8da7550.zip";
    hash = "sha256-FvjwrmRE9xXkDIIkOyxVEFdycYa/t2Z0EgBueV+26BQ=";
  };

  dontBuild = true;
  dontFixup = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out

    cp ja-netfilter.jar $out
    cp -r config-jetbrains $out
    cp -r plugins-jetbrains $out

    runHook postInstall
  '';

  meta = {
    description = "Jetbrains IDEs crack";
    homepage = "https://3.jetbra.in";
  };
})
