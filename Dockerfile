FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y --no-install-recommends curl ca-certificates
RUN curl -o grafana.deb https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_5.3.3_armhf.deb
RUN apt-get install -y ./grafana.deb
RUN rm grafana.deb

EXPOSE 3000

VOLUME /var/lib/grafana

CMD ["grafana-server", "-homepath", "/usr/share/grafana", "-config", "/etc/grafana/grafana.ini"]
