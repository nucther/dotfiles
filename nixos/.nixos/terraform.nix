{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="terraform";
    name="terraform-dev";
    buildInputs=[
        pkgs.terraform
        pkgs.terraform-docs
        pkgs.tfsec
    ];

    shellHook= ''
        echo "Start Terraform Dev Environment"
        '';
}
