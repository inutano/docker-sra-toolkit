FROM ubuntu:20.04
ENV VERSION 2.10.9
RUN apt-get update -y && \
      apt-get install -y wget && \
      apt-get clean && \
      rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* && \
      wget -P /usr/bin "https://raw.githubusercontent.com/inutano/pfastq-dump/master/bin/pfastq-dump" && \
      chmod +x /usr/bin/pfastq-dump && \
      wget -P / "http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/${VERSION}/sratoolkit.${VERSION}-ubuntu64.tar.gz" && \
      tar zxf /sratoolkit.${VERSION}-ubuntu64.tar.gz && \
      cp -r /sratoolkit.${VERSION}-ubuntu64/bin/* /usr/bin && \
      rm -fr /sratoolkit.${VERSION}-ubuntu64*
