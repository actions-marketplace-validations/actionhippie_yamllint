FROM alpine:3.23@sha256:be171b562d67532ea8b3c9d1fc0904288818bb36fc8359f954a7b7f1f9130fb2

# renovate: datasource=pypi depName=yamllint
ENV YAMLLINT_VERSION=1.37.1

RUN apk add --no-cache bash python3 python3-dev py3-pip && \
    pip3 install --break-system-packages -U yamllint==${YAMLLINT_VERSION} && \
    rm -rf /root/.cache

ENTRYPOINT ["/usr/local/bin/entrypoint"]
COPY overlay /
