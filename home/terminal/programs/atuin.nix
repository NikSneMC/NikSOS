{
  programs.atuin = {
    enable = true;

    daemon.enable = true;

    flags = [
      "--disable-up-arrow"
    ];

    settings = {
      dialect = "uk";
      update_check = false;
      keymap_mode = "vim-insert";
      dotfiles.enabled = true;
    };
  };
}
