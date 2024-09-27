FROM  centos:latest
MAINTAINER satishpanda430@gmail.com
RUN yum install -y httpd \
 zip\
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page293/photosec.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 85
