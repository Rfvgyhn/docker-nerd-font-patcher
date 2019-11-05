FROM python:3.7.4-alpine3.10
LABEL org.opencontainers.image.title="Nerd Font Patcher"
LABEL org.opencontainers.image.url="https://github.com/ryanoasis/nerd-fonts#option-8-patch-your-own-font"
LABEL org.opencontainers.image.source="https://github.com/Rfvgyhn/docker-nerd-font-patcher"

ARG VERSION=2.0.0
LABEL org.opencontainers.image.version=$VERSION

RUN apk update
RUN apk add --no-cache curl bash
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing fontforge

WORKDIR /usr/local/src

RUN curl -LSs https://github.com/ryanoasis/nerd-fonts/archive/v${VERSION}.tar.gz | \
    tar -xzvf - --strip-components=1 nerd-fonts-${VERSION}/font-patcher nerd-fonts-${VERSION}/src/glyphs

RUN touch /input && \
    mkdir -p /output

COPY run.sh .
RUN chmod +x run.sh

VOLUME /output

ARG CREATED
ARG REVISION
LABEL org.opencontainers.image.created=$CREATED
LABEL org.opencontainers.image.revision=$REVISION

ENTRYPOINT ["./run.sh"]
