{lib, ...}: let
  goTos =
    (
      9
      |> builtins.genList (num: 
        toString (num + 1)
        |> (n: lib.nameValuePair "goTo${n}" {key = "<A-${n}>";})
      )
      |> builtins.listToAttrs
    )
    // {
      first.key = "<A-f>";
      last.key = "<A-0>";
    };
in {
  programs.nixvim.plugins.barbar = {
    enable = true;
    settings.auto_hide = 1;
    keymaps =
      {
        close.key = "<A-c>";
        closeAllButCurrent.key = "<A-c-c>";
        closeAllButPinned.key = "<A-c-p>";
        closeAllButVisible.key = "<A-c-v>";
        closeBuffersLeft.key = "<A-c-h>";
        closeBuffersRight.key = "<A-c-l>";

        previous.key = "<A-,>";
        next.key = "<A-.>";
        movePrevious.key = "<A-s-,>";
        moveNext.key = "<A-s-.>";
        moveStart.key = "<A-s>";

        pin.key = "<A-p>";
        restore.key = "<A-s-c>";

        scrollLeft.key = "<A-h>";
        scrollRight.key = "<A-l>";
      }
      // goTos;
  };
}
