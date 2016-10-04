FROM busybox

ADD update_hosts.sh /bin/
RUN chmod +x /bin/update_hosts.sh

COPY static /httpserver/static
ADD babl-qa_linux_amd64 /bin/babl-qa
RUN chmod +x /bin/babl-qa

WORKDIR /

CMD /bin/update_hosts.sh && /bin/babl-qa -l=:$PORT -kb=$BABL_KAFKA_BROKERS