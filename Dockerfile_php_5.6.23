#version 1
#author:clc
#base image
FROM docker.io/anarh/centos6.6

#maintainer
MAINTAINER 474335602@qq.com

#commands

RUN mkdir -p /home/clc/tools && mkdir /application &&\
rm -rf /var/cache/yum/x86_64/6/epel/* && rm -rf /var/tmp/* && \
yum install wget -y && yum clean all && \
rm -rf /var/cache/yum/x86_64/6/epel/* && rm -rf /var/tmp/* && \
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo && \
wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-6.repo && \
yum install openssl openssl-devel tar wget gcc g++ zlib-devel  libxml2-devel  libjpeg-devel  libiconv-devel freetype-devel \
libpng-devel  gd-devel curl-devel libmcrypt-devel   mhash mhash-devel libxslt-devel mcrypt -y && yum clean all 

WORKDIR /home/clc/tools

RUN  useradd nginx -s /sbin/nologin -M && \
wget  http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.14.tar.gz && \
tar -zxvf libiconv-1.14.tar.gz && cd libiconv-1.14 && \
./configure --prefix=/usr/local/libiconv && \
make && make install && make clean && cd .. && \
rm -rf /home/clc/tools/libiconv 

RUN  wget -O php-5.6.23.tar.gz http://cn2.php.net/get/php-5.6.23.tar.gz/from/this/mirror && \
tar -zxf php-5.6.23.tar.gz && cd php-5.6.23 && \
./configure \
--prefix=/application/php-5.6.23 \
--with-mysql=mysqlnd \
--with-mysqli=mysqlnd \
--with-pdo-mysql=mysqlnd \
--with-iconv-dir=/usr/local/libiconv \
--with-freetype-dir \
--with-jpeg-dir \
--with-png-dir \
--with-zlib \
--with-libxml-dir=/usr \
--enable-xml \
--disable-rpath \
--enable-safe-mode \
--enable-bcmath \
--enable-shmop \
--enable-sysvsem \
--enable-inline-optimization \
--with-curl \
--with-curlwrappers \
--enable-mbregex \
--enable-fpm \
--enable-mbstring \
--with-mcrypt \
--with-gd \
--enable-gd-native-ttf \
--with-openssl \
--with-mhash \
--enable-pcntl \
--enable-sockets \
--with-xmlrpc \
--enable-zip \
--enable-soap \
--enable-short-tags \
--enable-zend-multibyte \
--enable-static \
--with-xsl \
--with-fpm-user=nginx \
--with-fpm-group=nginx \
--enable-ftp && \
touch ext/phar/phar.phar && make && make install && \
ln -s /application/php-5.6.23 /application/php && \
cp php.ini-production /application/php/lib/php.ini && \
cp /application/php/etc/php-fpm.conf.default  /application/php/etc/php-fpm.conf && \
sed -i 's#listen = 127.0.0.1:9000#listen = 0.0.0.0:9000#g' /application/php/etc/php-fpm.conf && \
make clean &&  rm -rf /home/clc/tools/* 

EXPOSE 9000
CMD ["/application/php/sbin/php-fpm","-F"]


