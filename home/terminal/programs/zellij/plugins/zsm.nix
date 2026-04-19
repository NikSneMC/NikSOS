{
  config,
  lib',
  ...
}:
lib'.zellij.zellijPlugin {
  name = "zsm";
  url = "https://github.com/liam-mackie/zsm/releases/download/v0.4.1/zsm.wasm";
  sha256 = "sha256-+VCf9MEHQVmr2q8lu95jAOsvCQU0iJa3ljqbnIC9ywg=";
  config =
    # kdl
    ''
      default_layout "custom"

      session_separator "_"

      show_resurrectable_sessions true

      base_paths "${config.home.homeDirectory}/Projects"
    '';
}
