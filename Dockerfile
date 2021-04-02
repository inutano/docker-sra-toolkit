FROM ncbi/sra-tools:2.11.0
RUN apk update && \
    apk add --no-cache util-linux curl && \
      curl --output /usr/bin/pfastq-dump "https://raw.githubusercontent.com/inutano/pfastq-dump/master/bin/pfastq-dump" && \
      chmod +x /usr/bin/pfastq-dump
COPY ./configure-and-run /configure-and-run
ENTRYPOINT ["/configure-and-run"]
