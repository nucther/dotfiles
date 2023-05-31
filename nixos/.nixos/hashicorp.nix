{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="hashicorp";
    name="hashicorp-dev";
    buildInputs=[
        pkgs.terraform
        pkgs.terraform-docs
        pkgs.tfsec
        pkgs.vault
        pkgs.boundary
    ];

    shellHook= ''
        echo "Start Hashicorp Dev Apps"
        '';
}
