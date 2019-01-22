ARG GRAFANA_VERSION

FROM ubuntu:18.04

ENV GRAFANA_VERSION $GRAFANA_VERSION
RUN apt-get update
RUN apt-get install -y --no-install-recommends curl ca-certificates
RUN curl -sfo grafana.deb https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_${GRAFANA_VERSION}_armhf.deb
RUN apt-get install -y ./grafana.deb
RUN apt-get clean
RUN rm grafana.deb

EXPOSE 3000

VOLUME /var/lib/grafana

CMD ["grafana-server", "-homepath", "/usr/share/grafana", "-config", "/etc/grafana/grafana.ini"]
