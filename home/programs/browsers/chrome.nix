
{pkgs, ...}: {
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
      "cjpalhdlnbpafiamejdnhcphjbkeiagm"
      "kjhdffcfinhkdfbbhjlfoadcdfgihmlp"
      "eimadpbcbfnmbkopoojfekhnkhdbieeh"
      "apmmpaebfobifelkijhaljbmpcgbjbdo"
      "cbghhgpcnddeihccjmnadmkaejncjndb"
      "mnjggcdmjocbbbhaepdhchncahnbgone"
      "pljikjgdcelenhecaainhheabilopmcc"
    ];
  };

  home.packages = with pkgs; [
    vivaldi-ffmpeg-codecs
  ];
}
