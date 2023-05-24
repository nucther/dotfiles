{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="vault";
    name="vault-dev";
    buildInputs=[
        pkgs.vault-bin
    ];

    shellHook= ''
        echo "Start Vault Dev Environment"
        '';
}
