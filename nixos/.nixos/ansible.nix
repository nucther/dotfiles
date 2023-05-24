{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="ansible";
    name="ansible-dev";
    buildInputs=[
        pkgs.ansible
        pkgs.ansible-lint
    ];

    shellHook= ''
        export LANG=C.UTF-8
        echo "Start Ansible Dev Environment"
        '';
}
