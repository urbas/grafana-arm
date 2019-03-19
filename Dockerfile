FROM buildpack-deps:bionic-curl

RUN apt-get update

ARG GRAFANA_VERSION
RUN curl -sfo grafana.deb https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_${GRAFANA_VERSION}_armhf.deb
RUN apt-get install -y ./grafana.deb
RUN rm grafana.deb

RUN rm -rf /var/lib/apt/lists/*
RUN apt-get clean

EXPOSE 3000

VOLUME /var/lib/grafana

CMD ["grafana-server", "-homepath", "/usr/share/grafana", "-config", "/etc/grafana/grafana.ini"]
