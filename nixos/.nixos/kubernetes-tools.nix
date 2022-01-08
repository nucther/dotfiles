
{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="kubeval";
    name="kubeval-dev";
    buildInputs=[
        pkgs.kubeval
        pkgs.kube-score
    ];

    shellHook= ''
        echo "Start Kubeval Dev Environment"
        '';
}
