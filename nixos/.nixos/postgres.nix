{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="PostgreSQL";
    name="postgres-dev";
    buildInputs=[
        pkgs.postgresql_15
    ];

    shellHook= ''
        echo "Start PostgreSQL Environment"
        '';
}
