{
  inputs,
  pkgs,
  config,
  ...
}: {
  # themable spotify
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    enable = true;

    windowManagerPatch = true;
    wayland = true;

    theme = spicePkgs.themes.catppuccin;

    colorScheme = config.theme.flavor;

    enabledExtensions = with spicePkgs.extensions; [
      autoSkipVideo
      bookmark
      keyboardShortcut
      loopyLoop
      popupLyrics
      shuffle
      trashbin
      powerBar
      seekSong
      fullAlbumDate
      goToSong
      wikify
      songStats
      showQueueDuration
      copyToClipboard
      betterGenres
      hidePodcasts
      adblock
      autoSkip
      playNext
      volumePercentage
      copyLyrics
      playingSource
      beautifulLyrics
    ];

    enabledCustomApps = with spicePkgs.apps; [
      lyricsPlus
    ];
  };
}
