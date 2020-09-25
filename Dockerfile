FROM ubuntu

RUN apt-get -y update
RUN apt-get -y install redis-server

COPY ./start.sh: /app

WORKDIR /app

RUN groupadd -g 1999 appuser && \
    useradd -r -u 1999 -g appuser 1729
USER 1729

LABEL maintainer="karthik.thirumalasetti@walmartlabs.com" \
      description="WCNP Example Node Git BYOC"

EXPOSE 6379
EXPOSE 8080

CMD ["./start.sh"]

