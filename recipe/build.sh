#!/bin/bash

set -e

./configure --prefix=$PREFIX \
	    --with-zlib=$PREFIX \
	    --with-bzip=$PREFIX

make
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
make check &> make_check.log || { cat make_check.log; exit 1; }
fi
make install
