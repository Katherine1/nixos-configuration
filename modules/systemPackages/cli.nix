{ config, pkgs, inputs, ... }:
{
    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-serif
        noto-fonts-cjk-sans
        maple-mono.truetype
        maple-mono.NF-unhinted
        maple-mono.NF-CN-unhinted
        atkinson-hyperlegible
    ];

    programs.yazi.enable = true;

    environment.systemPackages = with pkgs; [
        #Essentials
        neovim
        bat
        btop
        chezmoi
        duf
        dust
        eza
        fastfetch
        fd
        fzf
        git
        httpie
        parallel
        ripgrep
        tldr
        tmux
        usbutils

        #Services
        openssl

        #Archive Formats
        rar
    ];
}
