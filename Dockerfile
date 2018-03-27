FROM vfac/envdevphpbase:7.2-cli-alpine
LABEL maintainer="Vincent Faliès <vincent@vfac.fr>"

USER root
RUN apk update \
    && apk upgrade \
    && apk add \
        openssh \
    && rm -rf /var/cache/apk/*

COPY composer.json /app/composer.json

USER vfac

RUN cd /app/ \
    && composer update --lock

WORKDIR /app

ENTRYPOINT ["/app/vendor/bin/dep"]
