{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="freeradius";
    name="freeradius-dev";
    buildInputs=[
        pkgs.freeradius
    ];

    shellHook= ''
        echo "Start Freeradius Dev Environment"
        '';
}
