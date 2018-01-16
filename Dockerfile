FROM vfac/envdevphpbase:7.2-alpine
LABEL maintainer="Vincent Faliès <vincent@vfac.fr>"

RUN apk update \
    && apk upgrade \
    && apk add \
        openssh

COPY composer.json /app/composer.json

RUN cd /app/ \
    && composer update --lock

# RUN curl -LO https://deployer.org/deployer.phar \
#     && mv deployer.phar /usr/local/bin/dep \
#     && chmod +x /usr/local/bin/dep

RUN rm -rf /var/cache/apk/*

WORKDIR /app

ENTRYPOINT ["/app/vendor/bin/dep"]