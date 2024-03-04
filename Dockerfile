FROM ubuntu:22.04 AS builder

# renovate: datasource=github-releases depName=pgbouncer/pgbouncer versioning=regex:^.*_?(?<major>\d+)\_(?<minor>\d+)\_(?<patch>\d+)?$
ENV PGBOUNCER_VERSION="pgbouncer_1_22_1"

RUN apt update && apt install -y \
    pkg-config autoconf autoconf-doc automake gcc \
    libc-dev libevent-dev libtool make man libssl-dev \
    openssl libevent-2.1-7 libc-ares-dev wget

RUN PGBOUNCER_DOT_VERSION=$(echo ${PGBOUNCER_VERSION#pgbouncer_} | sed 's,_,.,g') && \
  cd /tmp && \
  wget -O "/tmp/pgbouncer.tar.gz" "https://github.com/pgbouncer/pgbouncer/releases/download/${PGBOUNCER_VERSION}/pgbouncer-${PGBOUNCER_DOT_VERSION}.tar.gz" && \
  tar -xf "./pgbouncer.tar.gz" && \
  mv /tmp/pgbouncer-$PGBOUNCER_DOT_VERSION /tmp/pgbouncer-dir && \
  "/tmp/pgbouncer-dir/configure" --prefix=/usr && \
  make

FROM builder AS final

RUN apt-get update && apt-get install -y openssl libevent-2.1-7 libc-ares2

RUN adduser --system --no-create-home --disabled-password --disabled-login pgbouncer \
    && mkdir -p /etc/pgbouncer /var/log/pgbouncer /var/run/pgbouncer \
    && chown pgbouncer /var/run/pgbouncer /var/log/pgbouncer

COPY --from=builder /tmp/pgbouncer-dir/etc/pgbouncer.ini /etc/pgbouncer/pgbouncer.ini
COPY --from=builder /tmp/pgbouncer /usr/bin/pgbouncer

USER pgbouncer
CMD ["/usr/bin/pgbouncer", "/etc/pgbouncer/pgbouncer.ini"]

