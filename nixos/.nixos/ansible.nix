{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="ansible";
    name="ansible-dev";
    buildInputs=[
        pkgs.ansible_2_11
    ];

    shellHook= ''
        echo "Start Ansible Dev Environment"
        '';
}
