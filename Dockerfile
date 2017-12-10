FROM vfac/envdevphpbase
LABEL maintainer="Vincent Faliès <vincent@vfac.fr>"

RUN apk update \
    && apk upgrade \
    && apk add \
        curl

RUN curl -LO https://deployer.org/deployer.phar \
    && mv deployer.phar /usr/local/bin/dep \
    && chmod +x /usr/local/bin/dep

RUN rm -rf /var/cache/apk/*

WORKDIR /app

ENTRYPOINT ["dep"]