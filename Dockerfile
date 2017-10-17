FROM ubuntu:xenial

RUN echo "deb http://dl.bintray.com/matej/deb-packages xenial main" | tee -a /etc/apt/sources.list

RUN apt-get update --allow-unauthenticated && apt-get install -y --allow-unauthenticated grafana=4.5.2

EXPOSE 3000

VOLUME /var/lib/grafana

CMD ["grafana-server", "-homepath", "/usr/share/grafana", "-config", "/etc/grafana/grafana.ini"]
