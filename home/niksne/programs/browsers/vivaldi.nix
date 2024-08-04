{
  lib,
  pkgs,
  ...
}: {
  programs.vivaldi = {
    enable = true;
    package = pkgs.vivaldi.override {
      proprietaryCodecs = true;
      enableWidevine = true;
    };
    commandLineArgs = [
      "--enable-features=UseOzonePlatform"
      "--ozone-platform=wayland"
    ];
    extensions = [
      "kjhdffcfinhkdfbbhjlfoadcdfgihmlp"
      "eimadpbcbfnmbkopoojfekhnkhdbieeh"
      "apmmpaebfobifelkijhaljbmpcgbjbdo"
      "cbghhgpcnddeihccjmnadmkaejncjndb"
      "mnjggcdmjocbbbhaepdhchncahnbgone"
      "onnfghpihccifgojkpnnncpagjcdbjod"
    ];
  };

  home.packages = with pkgs; [
    vivaldi-ffmpeg-codecs
  ];
}