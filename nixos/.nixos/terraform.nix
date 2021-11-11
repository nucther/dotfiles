{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    name="terraform-dev";
    buildInputs=[
        pkgs.terraform
    ];

    shellHook= ''
        echo "Start Terraform Dev Environment"
        '';
}
