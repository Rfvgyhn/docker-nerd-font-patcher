FROM python:3.7.4-alpine3.10

ARG NERD_VERSION=2.0.0

RUN apk update
RUN apk add --no-cache curl bash
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing fontforge

WORKDIR /usr/local/src

RUN curl -LSs https://github.com/ryanoasis/nerd-fonts/archive/v${NERD_VERSION}.tar.gz | \
    tar -xzvf - --strip-components=1 nerd-fonts-${NERD_VERSION}/font-patcher nerd-fonts-${NERD_VERSION}/src/glyphs

RUN mkdir -p /input /output

COPY run.sh .
RUN chmod +x run.sh

VOLUME /input
VOLUME /output

ENTRYPOINT ["./run.sh"]
