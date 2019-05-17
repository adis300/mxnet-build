# mxnet-build
* clone mxnet repository recursively.
## OSX
* check permissions to brew to install openblas `sudo chown -R $(whoami) /usr/local/share/man/man5`
* give permissions to brew to install openblas `chmod u+w /usr/local/share/man/man5`
* `brew install openblas`
* copy your config file from `make/*.mk` to `[srcroot]/config.mk`
* run `make or make -j8`

