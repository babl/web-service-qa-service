FROM busybox

ADD update_hosts.sh /bin/
RUN chmod +x /bin/update_hosts.sh

ADD babl-qa_linux_amd64 /bin/babl-qa
COPY static /bin/static
RUN chmod +x /bin/babl-qa

CMD ["/bin/update_hosts.sh; /bin/babl-qa -l=:$PORT -kb=queue.babl.sh:9092"]
