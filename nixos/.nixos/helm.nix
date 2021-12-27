{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="helm";
    name="helm-dev";
    buildInputs=[
        pkgs.kubernetes-helm
    ];

    shellHook= ''
        echo "Start Helm Dev Environment"
        '';
}
