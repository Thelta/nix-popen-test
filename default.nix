{ pkgs ? (import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/6fc2b7ecc2a167ce6a6902d5417daf1fa5cac777.tar.gz") {}) }:

    let exe = pkgs.stdenv.mkDerivation {
        name = "test";
        src = ./.;
        out = [ ./main ];
        nativeBuildInputs = [pkgs.gcc pkgs.coreutils pkgs.bash];

        buildPhase = ''
            g++ main.cpp -o main
        '';

        installPhase = ''
            mkdir -p $out/bin
            cp main $out/bin
        '';
    };

    in

    pkgs.dockerTools.buildImage {
        name = "test";
        config = {
            Env = [ "PATH=${pkgs.coreutils}/bin:${pkgs.bash}/bin" ]; 
            Cmd = [ "${exe}/bin/main" ];
        };
    }