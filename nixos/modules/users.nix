{ pkgs, npkgs, ...}:

{
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users = {
        niksne = {
            isNormalUser = true;
            description = "NikSne";
            extraGroups = [ "networkmanager" "wheel" "audio" "video" "docker"];
	        shell = pkgs.fish;
            packages = (with pkgs; [
                authy
                vivaldi
                vivaldi-ffmpeg-codecs
                
                obs-studio
                obs-studio-plugins.wlrobs
                prismlauncher
                spotify
                blockbench-electron

                vscodium
                github-desktop
                neovim
                hoppscotch
                rpi-imager

                jetbrains.rust-rover

                vesktop
                tdesktop
                whatsapp-for-linux
            ]) ++ (with npkgs; [
                spicetify-cli

                jetbrains.idea-ultimate
                jetbrains.pycharm-professional
                jetbrains.webstorm
                jetbrains.datagrip
                jetbrains.clion
                jetbrains.goland
                jetbrains.gateway
                jetbrains.writerside
            ]);
        };
    };
}
