FROM hyperledger/besu:21.10.6
USER root
RUN  apt-get update && apt-get install gettext-base -y
RUN  mkdir /opt/lacchain &&  chmod 777 /opt/lacchain && chown -R besu:besu /opt/lacchain
USER besu
