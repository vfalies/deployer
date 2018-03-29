FROM vfac/envdevphpbase:7.2-cli-alpine
LABEL maintainer="Vincent Faliès <vincent@vfac.fr>"

USER root
RUN apk update \
    && apk upgrade \
    && apk add \
        openssh \
    && rm -rf /var/cache/apk/*

COPY composer.json /deployer/composer.json

USER root
RUN chown -R vfac:vfac /deployer

USER vfac

RUN cd /deployer/ \
    && composer install

ENTRYPOINT ["/deployer/vendor/bin/dep"]
