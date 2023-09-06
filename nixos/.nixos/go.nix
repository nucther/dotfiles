{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="go";
    name="Go Lang-dev";
    buildInputs=[
        pkgs.go
    ];

    shellHook= ''
        echo "Start Go Lang Dev Environment"
        '';
}
