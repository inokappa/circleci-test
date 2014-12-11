# Pull base image.
FROM inokappa/wheezy-7.2-basic:latest
 
# Install ElasticSearch.
#RUN \
#  cd /tmp && \
#  wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.2.1.tar.gz && \
#  tar xvzf elasticsearch-1.2.1.tar.gz && \
#  rm -f elasticsearch-1.2.1.tar.gz && \
#  mv /tmp/elasticsearch-1.2.1 /elasticsearch

#
RUN \
  apt-get update && \
  apt-get -y install ruby1.9.1 && \
  gem install serverspec --no-ri --no-rdoc -V && \
  gem install rake --no-ri --no-rdoc -V
#
RUN \
  mkdir /root/serverspec
#
ADD \
  Rakefile /root/serverspec/ 
#
ADD \
  spec /root/serverspec/spec/
#
ADD \
  start.sh /
#
RUN \
  chmod 755 /start.sh

# Define mountable directories.
#VOLUME ["/data"]
#
## Define working directory.
#WORKDIR /data

# Define default command.
#CMD ["/elasticsearch/bin/elasticsearch"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
#EXPOSE 9200
#EXPOSE 9300
