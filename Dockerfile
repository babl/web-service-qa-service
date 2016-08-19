FROM busybox

ADD update_hosts.sh /bin/
RUN chmod +x /bin/update_hosts.sh

COPY static /bin/httpserver/static
ADD babl-qa_linux_amd64 /bin/babl-qa
RUN chmod +x /bin/babl-qa

CMD ["/bin/update_hosts.sh; /bin/babl-qa -l=:$PORT -kb=queue.babl.sh:9092"]
