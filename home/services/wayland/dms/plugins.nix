{pkgs, ...}: {
  programs.dank-material-shell.plugins = let
    inherit (builtins) mapAttrs;
    inherit (pkgs) fetchFromGitHub;

    fetchSources = mapAttrs (_: meta:
      if builtins.isAttrs meta
      then fetchFromGitHub meta
      else meta);

    dms-plugins = fetchSources {
      official = {
        owner = "AvengeMedia";
        repo = "dms-plugins";
        rev = "8fa7c5286171c66a209dd74e9a47d6e72ccfdad6";
        hash = "sha256-0RXRgUXXoX+C0q+drsShjx2rCTdmqFzOCR/1rGB/W2E=";
      };
      lucyfire = {
        owner = "lucyfire";
        repo = "dms-plugins";
        rev = "09348b5caae704277898e73e91adfcd72ff1da4e";
        hash = "sha256-eChaEjlfdzA6LXN2n8BaP11Gm0CJ20I9KoVhCpQf/yo=";
      };
    };
  in
    {
      alarmClock = "${dms-plugins.lucyfire}/alarmClock";
      calculator = {
        owner = "rochacbruno";
        repo = "DankCalculator";
        rev = "de6dbd59b7630e897a50e107f704c1cd4a131128";
        hash = "sha256-Vq+E2F2Ym5JdzjpCusRMDXd6uuAhhjAehyD/tO3omdY=";
      };
      commandRunner = {
        owner = "devnullvoid";
        repo = "dms-command-runner";
        rev = "d89a09413e2fc041089b595a06c0fb316b12e17a";
        hash = "sha256-tXqDRVp1VhyD1WylW83mO4aYFmVg/NV6Z/toHmb5Tn8=";
      };
      dankBatteryAlerts = "${dms-plugins.official}/DankBatteryAlerts";
      dankPomodoroTimer = "${dms-plugins.official}/DankPomodoroTimer";
      emojiLauncher = {
        owner = "devnullvoid";
        repo = "dms-emoji-launcher";
        rev = "2951ec7f823c983c11b6b231403581a386a7c9f6";
        hash = "sha256-aub5pXRMlMs7dxiv5P+/Rz/dA4weojr+SGZAItmbOvo=";
      };
      niriWindows = {
        owner = "rochacbruno";
        repo = "DankNiriWindows";
        rev = "b845277ad505556caff828241ec6a80a75f0e034";
        hash = "sha256-rdZAnkRyfycI2a2wjSiepQwRI49zKbwoRzpz1+c6ZJA=";
      };
      webSearch = {
        owner = "devnullvoid";
        repo = "dms-web-search";
        rev = "81ccd9fd8249b3c9ef40dde42549f807e36ae3e3";
        hash = "sha256-mKbmROijhYhy/IPbVxYbKyggXesqVGnS/AfAEyeQVhg=";
      };
    }
    |> fetchSources
    |> mapAttrs (_: src: {
      enable = true;
      inherit src;
    });
}
