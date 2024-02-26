{ pkgs, ... }:

{
    # Setup Env Variables
    environment.variables = {
        SPOTIFY_PATH = "${pkgs.spotify}/";
        JDK_PATH = "${pkgs.zulu17}/";
        NODEJS_PATH = "${pkgs.nodejs_21}/";
        PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
        CI = "1";
        STARSHIP_CONFIG = "~/.config/starship/starship.toml";
        EDITOR = "codium";
        XDG_DATA_DIR = "~/.local/share";
    };
}
