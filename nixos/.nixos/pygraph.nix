{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="pygraph";
    name="pygraph-dev";
    buildInputs=[
        pkgs.python312Packages.diagrams
        pkgs.graphviz
    ];

    shellHook= ''
        echo "Python Diagram Graph"
        '';
}
