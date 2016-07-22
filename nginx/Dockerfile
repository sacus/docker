#Version:1
#author:clc
#base images
FROM docker.io/centos
MAINTAINER 474335602@qq.com
ENV NGINX_VERSION 1.10.1
#commands

#env-pre
RUN  mkdir /application && \
rm -rf /var/cache/yum/x86_64/7/*　&& \
builddeps=" \
pcre \
pcre-devel \
openssl \
openssl-devel \
tar \
gcc \
" \
&& yum install -y ${builddeps} && \
rm -rf /var/cache/yum/x86_64/7/*


RUN useradd nginx -s /sbin/nologin -M && \
curl -fSL http://nginx.org/download/nginx-1.10.1.tar.gz -o nginx-1.10.1.tar.gz \
&& tar -zxvf nginx-1.10.1.tar.gz && \
cd nginx-1.10.1  && \
./configure --prefix=/application/nginx-1.10.1 \
--user=nginx \
--group=nginx \
--with-http_ssl_module \
--with-http_stub_status_module && \
make && make install && \
ln -s /application/nginx-1.10.1 /application/nginx && \
rm -rf /nginx-1.10.1*

EXPOSE 80 443 

CMD ["/application/nginx/sbin/nginx", "-g", "daemon off;"]
