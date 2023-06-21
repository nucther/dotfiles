{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="ops";
    name="ops";
    buildInputs=[
        pkgs.terraform
        pkgs.terraform-docs
        pkgs.tfsec
        pkgs.vault
        pkgs.boundary
        pkgs.ansible
        pkgs.ansible-lint
        pkgs.kubernetes-helm
        pkgs.helmfile
    ];

    shellHook= ''
        export LANG=C.UTF-8
        echo "Start working as DevOps"
        '';
}
