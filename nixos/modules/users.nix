{ pkgs, pkgs-stable, ...}:

{
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users = {
        niksne = {
            isNormalUser = true;
            description = "NikSne";
            extraGroups = [ "networkmanager" "wheel" "audio" "video"];
	        shell = pkgs.fish;
            packages = [
                pkgs.authy
                pkgs.vivaldi
                pkgs.vivaldi-ffmpeg-codecs
                pkgs.firefox
                
                pkgs.obs-studio
                pkgs.obs-studio-plugins.wlrobs
                pkgs.prismlauncher
                pkgs.spotify
                pkgs.spicetify-cli
                pkgs.blockbench-electron

                pkgs.vscodium
                pkgs.github-desktop
                pkgs.neovim
                pkgs.hoppscotch
                pkgs.rpi-imager

                pkgs.jetbrains.idea-ultimate
                pkgs.jetbrains.pycharm-professional
                pkgs.jetbrains.webstorm
                pkgs.jetbrains.datagrip
                pkgs.jetbrains.rust-rover
                pkgs.jetbrains.clion
                pkgs.jetbrains.goland
                pkgs.jetbrains.gateway

                pkgs.vesktop
                pkgs.tdesktop
                pkgs.whatsapp-for-linux
            ];
        };
    };
}
