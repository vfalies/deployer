FROM vfac/envdevphpbase:7.1
LABEL maintainer="Vincent Faliès <vincent@vfac.fr>"

RUN curl -LO https://deployer.org/deployer.phar \
    && mv deployer.phar /usr/local/bin/dep \
    && chmod +x /usr/local/bin/dep

WORKDIR /app

ENTRYPOINT ["dep"]