# Pull base image.
FROM inokappa/wheezy-7.2-basic:latest
 
#
RUN \
  apt-get update && \
  apt-get -y install ruby1.9.1 && \
  gem install serverspec --no-ri --no-rdoc -V && \
  gem install rake --no-ri --no-rdoc -V
#
RUN \
  wget https://opscode-omnibus-packages.s3.amazonaws.com/debian/6/x86_64/chefdk_0.3.5-1_amd64.deb && \
  dpkg -i chefdk_0.3.5-1_amd64.deb
#  
ADD \
  chef-solo /root/chef-solo/
#
ADD \
  chef_apply.sh /
#
RUN \
  chmod 755 /chef_apply.sh && \
  /chef_apply.sh
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
  spec_start.sh /
#
RUN \
  chmod 755 /spec_start.sh
