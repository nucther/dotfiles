
{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="kubeval";
    name="kubeval-dev";
    buildInputs=[
        pkgs.kubeval
        pkgs.kube-score
        pkgs.kubernetes-helm
    ];

    shellHook= ''
        echo "Start Kubeval Dev Environment"
        '';
}
