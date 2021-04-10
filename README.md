
# Solution

popen requires /bin/sh which doesn't provide. Add bash to your buildinputs then during buildImage link ${pkgs.bash}/bin/sh to /bin/sh .


# Problem

Current Env: Manjaro with nix.

When a popen function call happen in a docker container which's image is built by dockerTools.buildImage, popen fails with errno 12 (aka ENOMEM). 
This doesn't happen in nix-shell nor any docker image built in any other distro.

``` bash
nix-build
docker load < result
docker run --rm <image-name>
```

If program works normally it should exit with 0. If any error happens then it will print errno then will exit with that errno.