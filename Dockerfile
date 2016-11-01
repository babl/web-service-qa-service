FROM alpine:3.4

COPY static /httpserver/static
ADD babl-qa_linux_amd64 /bin/babl-qa
RUN chmod +x /bin/babl-qa

WORKDIR /

CMD /bin/babl-qa -l=:$PORT -kb=$BABL_KAFKA_BROKERS