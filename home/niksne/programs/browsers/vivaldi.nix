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
      "--proxy-server="http://127.0.0.1:8888""
    ];
    extensions = [
      "kjhdffcfinhkdfbbhjlfoadcdfgihmlp"
      "eimadpbcbfnmbkopoojfekhnkhdbieeh"
      "apmmpaebfobifelkijhaljbmpcgbjbdo"
      "cbghhgpcnddeihccjmnadmkaejncjndb"
      "mnjggcdmjocbbbhaepdhchncahnbgone"
    ];
  };

  home.packages = with pkgs; [
    vivaldi-ffmpeg-codecs
  ];
}