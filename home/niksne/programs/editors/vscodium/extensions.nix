{
    pkgs,
    ...
}: {
    programs.vscode.extensions = with pkgs.vscode-extensions; [
        asciidoctor.asciidoctor-vscode
        astro-build.astro-vscode
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        naumovs.color-highlight
        serayuzgur.crates
        mkhl.direnv
        leonardssh.vscord
        editorconfig.editorconfig
        dbaeumer.vscode-eslint
        mathiasfrohlich.kotlin
        arrterian.nix-env-selector
        jnoortheen.nix-ide
        brettm12345.nixfmt-vscode
        ms-python.python
        rust-lang.rust-analyzer
        stylelint.vscode-stylelint
        bradlc.vscode-tailwindcss
        wakatime.vscode-wakatime
    ];
}
