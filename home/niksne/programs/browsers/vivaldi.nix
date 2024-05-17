{
  pkgs,
  ...
}: {
  programs.vivaldi = {
    enable = true;
    package = pkgs.vivaldi.override {
      proprietaryCodecs = true;
      enableWidevine = true;
    };
    commandLineArgs = [];
    extensions = [
      {id = "kjhdffcfinhkdfbbhjlfoadcdfgihmlp";}
      {id = "eimadpbcbfnmbkopoojfekhnkhdbieeh";}
      {id = "apmmpaebfobifelkijhaljbmpcgbjbdo";}
      {id = "cbghhgpcnddeihccjmnadmkaejncjndb";}
    ];
  };

  home.packages = with pkgs; [
    vivaldi-ffmpeg-codecs
  ];
}