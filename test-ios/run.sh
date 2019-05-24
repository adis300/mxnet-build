#!/bin/bash

uname -a
echo "---------------------------------------------------------------------------"
gcc -v
echo "---------------------------------------------------------------------------"

gcc -o test main.c libmxnet_predict.a -framework Accelerate -lstdc++
./test
