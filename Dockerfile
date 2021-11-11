FROM sharpreflections/centos6-build-base
LABEL maintainer="juergen.wind@sharpreflections.com"

ARG prefix=/opt

WORKDIR /build/

COPY --from=sharpreflections/centos6-build-cmake     $prefix $prefix

RUN git clone https://github.com/ninja-build/ninja.git && \
    cd ninja && git checkout release && mkdir tmpbuild && cd tmpbuild && \
    /opt/cmake-3.20.1-linux-x86_64/bin/cmake -DCMAKE_INSTALL_PREFIX=/opt/ninja .. && \
    make install && \
    rm -rf /build/*
