FROM hyperledger/besu:23.4.1
USER root
RUN  apt-get update && apt-get install gettext-base -y
RUN  mkdir /opt/lacchain &&  chmod 777 /opt/lacchain && chown -R besu:besu /opt/lacchain
USER besu
