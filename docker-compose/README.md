# docker-comose to lnmp-haproxy
***
## dockerfile说明

事例中的php和nginx镜像都是自己构建立的，为了方便，我也构建了一个php和nginx在一个镜像里，但mysql这块，我还是没有用容器，相信生产中也是很少会把mysql这么重要的应用放在docker里吧，如果需要用尽量用官方的，我自己也构建了一个太大了，是编译安装的，1.5G，docker的hub中也有。

### nginx和php分开运行说明
如果nginx和php分开运行的话，需要共享网站目录，应该是nginx去共享nginx的网站目录，而且nginx配置文件也是要配置成全路径，nginx的php配置也需要配置全路径的php,nginx可以用volumes_from。

### lnmp和lnmp1说明
lnmp1是启动了三个web和三个php,是分开的，对应的配置文件可以具体看docker-compose.yml的配置中的挂载情况。这三个web的作用是服务于lnmp的。   
lnmp本身有三个web,这个web是nginx和php在一个容器中的，还有一个haproxy,haproxy代理lnmp的三台web和lnmp1的三台web,也就是相当于有6台web.   
lnmp是通过中的haproxy是通过external_links去链接lnmp1中的web,不过名字是要启动lnmp1之后的名字，直接用lnmp1中的名字是不可以的。

### 运行6台web和一台haproxy
启动顺序：要先启动lnmp1,在启动lnmp。docker-compose up &    
停止命令：docker-compose down    

