
{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="docker";
    name="docker-dev";
    buildInputs=[
        pkgs.docker
    ];

    shellHook= ''
        echo "Start Docker Dev Environment"
        '';
}
