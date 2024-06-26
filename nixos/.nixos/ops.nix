{ pkgs? import <nixpkgs> {
        config.allowUnfree = true;
} }:
pkgs.mkShell {
    nixlang="ops";
    name="ops";
    buildInputs=[
        pkgs.tfsec
        pkgs.vault-bin
        pkgs.boundary
        pkgs.ansible
        pkgs.ansible-lint
        pkgs.kubernetes-helm
        pkgs.helmfile
        pkgs.sshpass
        pkgs.python311Packages.jmespath
        pkgs.python311Packages.netaddr
        pkgs.python311Packages.kubernetes
        pkgs.python311Packages.pytz
        pkgs.terraform
        pkgs.terraform-docs
    ];

    shellHook= ''
        export LANG=C.UTF-8
        echo "Start working as DevOps"
        source ~/.terraform
        '';
}
