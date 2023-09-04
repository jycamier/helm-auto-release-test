FROM ubuntu:22.04

# renovate: datasource=github-releases depName=pgbouncer/pgbouncer versioning=regex:^.*_?(?<major>\d+)\_(?<minor>\d+)\_(?<patch>\d+)?$
ENV PGBOUNCER_VERSION="1_19_0"

RUN echo $PGBOUNCER_VERSION | sed -E 's,_,.,g'