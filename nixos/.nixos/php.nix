{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="php";
    name="php-dev";
    buildInputs=[
        pkgs.php
    ];

    shellHook= ''
        echo "Start PHP Dev Environment"
        '';
}
