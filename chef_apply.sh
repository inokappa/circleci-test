#!/bin/sh

cd /root/
chef-apply chef-solo/site-cookbooks/apache/recipes/default.rb
