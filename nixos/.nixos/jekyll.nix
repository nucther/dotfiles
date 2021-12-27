{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="jekyll";
    name="jekyll-dev";
    buildInputs=[
        pkgs.jekyll
    ];

    shellHook= ''
        echo "Start Ruby Jenkyll Dev Environment"
        '';
}
