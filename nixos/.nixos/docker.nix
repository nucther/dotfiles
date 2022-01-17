
{ pkgs? import <nixpkgs> {} }:
pkgs.mkShell {
    nixlang="docker";
    name="docker-dev";
    buildInputs=[
        pkgs.docker
    ];

    shellHook= ''
        echo "Start Docker Dev Environment"
        did=$(sudo pgrep dockerd)
        if [ -z "$did" ]; then sudo dockerd & echo "Run Docker Daemon"; fi
        sleep 3
        echo "change docker.sock to $UID: $GID"
        sudo chown $UID /var/run/docker.sock
        '';
}
