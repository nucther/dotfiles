{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="Remmina";
    name="remmina";
    buildInputs=[
        pkgs.remmina
    ];

}
