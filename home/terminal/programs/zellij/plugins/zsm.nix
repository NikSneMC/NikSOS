{
  config,
  lib',
  ...
}:
lib'.zellij.zellijPlugin {
  name = "zsm";
  url = "https://github.com/liam-mackie/zsm/releases/download/v0.4.0/zsm.wasm";
  sha256 = "1s3pnfn0ppqwqmxympk0rrixzzw92671p4vpbn1x05knaf54mlxn";
  config =
    # kdl
    ''
      default_layout "custom"

      session_separator "_"

      show_resurrectable_sessions true

      base_paths "${config.home.homeDirectory}/Projects"
    '';
}
