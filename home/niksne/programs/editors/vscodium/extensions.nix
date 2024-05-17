{
    pkgs,
    ...
}: {
    programs.vscode.extensions = with pkgs.vscode-extensions; [
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        wakatime.vscode-wakatime
    ];
}