{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    name="jekyll-dev";
    buildInputs=[
        pkgs.jekyll
    ];

    shellHook= ''
        echo "Start Ruby Jenkyll Dev Environment"
        '';
}
