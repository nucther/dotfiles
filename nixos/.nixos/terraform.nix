{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="terraform";
    name="terraform-dev";
    buildInputs=[
        pkgs.terraform
    ];

    shellHook= ''
        echo "Start Terraform Dev Environment"
        '';
}
