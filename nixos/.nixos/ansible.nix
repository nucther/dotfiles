{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="ansible";
    name="ansible-dev";
    buildInputs=[
        pkgs.ansible
        pkgs.ansible-lint
    ];

    shellHook= ''
        echo "Start Ansible Dev Environment"
        '';
}
