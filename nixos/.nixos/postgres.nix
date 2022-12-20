{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="PostgreSQL";
    name="postgres-dev";
    buildInputs=[
        pkgs.postgresql
    ];

    shellHook= ''
        echo "Start Helm Dev Environment"
        '';
}
