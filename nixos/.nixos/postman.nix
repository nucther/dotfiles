{ pkgs? import <nixpkgs> {
        config.allowUnfree = true;
    } 
}:
pkgs.mkShell {
    nixlang="Postman";
    name="postman";
    buildInputs=[
        pkgs.postman
    ];

}
