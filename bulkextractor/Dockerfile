FROM ubuntu:14.04.3

RUN apt-get update && apt-get install -y \
  tar \
  git \
  libncurses5-dev \
  pkg-config \
  libtool \
  openjdk-7-jdk \
  ant \
  expect \
  libtre-dev \
  libssl-dev \
  libssl1.0.0 \
  libxml2-dev \
  libicu-dev \
  flex \
  zlib1g-dev \
  libsqlite3-dev \
  libbz2-dev \
  autoconf \
  libboost1.54-dev \
  clang \
  make \
  bison \
  libxml2 \
  libtre5 \
  libicu52 \
  libsqlite3-0 \
  wget \
  rsync \
  sqlite3 \
  findutils \
  coreutils \
  libewf-dev \
&& rm -rf /var/lib/apt/lists/*

RUN git clone --recursive https://www.github.com/simsong/bulk_extractor
RUN git clone --recursive https://github.com/jonstewart/liblightgrep.git

RUN cd liblightgrep && \
    ./bootstrap.sh && \
    ./configure --with-boost-chrono=no --with-boost-thread=no --with-boost-program-options=no --with-boost-system=no --prefix=/usr && \
    make && \
    make install && \
    ldconfig

RUN cd bulk_extractor && \
    chmod 755 bootstrap.sh && \
    ./bootstrap.sh && \
    ./configure --enable-lightgrep --prefix=/usr/local && \
    make -j 8 && \
    make install


COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

