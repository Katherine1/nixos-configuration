{ config, pkgs, cudapkgs, inputs, ... }:
{
    imports = [
        ../../../modules/users/emily
        ../../../modules/users/emily/cli.nix
        ../../../modules/users/emily/cli_multimedia.nix
        ../../../modules/users/emily/3dprinting.nix
        ../../../modules/users/emily/astro.nix
        ../../../modules/users/emily/books.nix
        ../../../modules/users/emily/chat.nix
        ../../../modules/users/emily/development.nix
        ../../../modules/users/emily/education.nix
        ../../../modules/users/emily/gaming.nix
        ../../../modules/users/emily/graphics.nix
        ../../../modules/users/emily/internet.nix
        ../../../modules/users/emily/multimedia.nix
        ../../../modules/users/emily/office.nix
        ../../../modules/users/emily/system.nix
    ];
}
