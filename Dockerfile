############################################################
# Dockerfile to build NARG Nginx Image
# Based on NARG Base Image
############################################################

# Set the image
FROM narg/base-docker-image:1.0

MAINTAINER Necip Arg

WORKDIR /usr/src

# Install Nginx Repository
RUN yum install -y http://nginx.org/packages/rhel/6/noarch/RPMS/nginx-release-rhel-6-0.el6.ngx.noarch.rpm

# Install PostgreSQL Server and Contrib
RUN yum install -y nginx

# Clean up YUM
RUN yum clean all

# Disable Nginx to run on background
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Expose the HTTP & HTTPS ports
EXPOSE 80
