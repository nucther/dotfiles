{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="rust";
    name="remmina";
    buildInputs=[
        pkgs.remmina
    ];

}
