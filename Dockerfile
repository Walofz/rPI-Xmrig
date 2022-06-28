FROM alpine:3.16 AS builder

ARG XMRIG_VERSION='v6.18.0'
WORKDIR /miner

RUN echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk update && apk add --no-cache \
    build-base \
    git \
    cmake \
    libuv-dev \
    linux-headers \
    libressl-dev \
    hwloc-dev@community

RUN git clone https://github.com/xmrig/xmrig && \
    mkdir xmrig/build && \
    cd xmrig && git checkout ${XMRIG_VERSION}

COPY src/c_donate.h xmrig/src/donate.h

RUN cd xmrig/build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release && \
    make -j$(nproc)


FROM alpine:3.16
LABEL owner="Doyalin"
LABEL maintainer="whoami@lazy.dev"

ENV WALLET=42zKbqEMHwA1FaHfsoVAP3JyQKDfd4PYEfAnjKvJrzTqEYjQqeFw62uAgNqY81SHogaUn4sTrVgTFZEGbdU5Xc39SubJXWr
ENV POOL=gulf.moneroocean.stream:10001
ENV PASS=doyalin
ENV DONATE=0
ENV COIN=monero

RUN echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk update && apk add --no-cache \
    libuv \
    libressl \
    hwloc@community

WORKDIR /xmr
COPY --from=builder /miner/xmrig/build/xmrig /xmr

CMD ["sh", "-c", "./xmrig -o $POOL -u $WALLET -p $PASS -k --donate-level $DONATE --coin $COIN"]
