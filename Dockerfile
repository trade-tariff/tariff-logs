FROM docker.elastic.co/logstash/logstash:7.16.2
RUN rm -f /usr/share/logstash/pipeline/logstash.conf && \
    rm -f /usr/share/logstash/config/logstash.yml && \
    rm -f /usr/share/logstash/config/logstash-sample.conf && \
  bin/logstash-plugin install logstash-output-newrelic logstash-input-syslog
ADD pipeline/ /usr/share/logstash/pipeline/
ADD config/ /usr/share/logstash/config/

EXPOSE 8080
