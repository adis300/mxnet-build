# TODO: Check and install all dependencies
#brew update
#brew install pkg-config
#brew install graphviz
#brew install openblas
#brew tap homebrew/core
#brew install opencv
# If building with MKLDNN
# brew install llvm

cp mxnet/make/osx.mk mxnet/config.mk
cd mxnet
echo "USE_BLAS = openblas" >> ./config.mk
echo "ADD_CFLAGS += -I/usr/local/opt/openblas/include" >> ./config.mk
echo "ADD_LDFLAGS += -L/usr/local/opt/openblas/lib" >> ./config.mk
echo "ADD_LDFLAGS += -L/usr/local/lib/graphviz/" >> ./config.mk
make -j$(sysctl -n hw.ncpu)

cd ..