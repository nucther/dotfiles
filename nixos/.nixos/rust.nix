{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="rust";
    name="Rust-dev";
    buildInputs=[
        pkgs.rustc
        pkgs.cargo
    ];

    shellHook= ''
        echo "Start Rust Dev Environment"
        '';
}
