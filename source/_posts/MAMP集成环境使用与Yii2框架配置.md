
---
title: MAMP集成环境使用与Yii2框架配置
date: 2018-04-14 10:43:50
tags: MacOS Unix MAMP Yii2
---

#### 三、MAMP集成环境使用与Yii2框架配置

> 继上章节MacOS内置的PHP开发环境（独立安装）完成之后，这里将来大招了，安装集成环境MAMP。
>
> 安装MAMP之后，你会发现，上面你所做的事情，基本上都是多余的，因为这个一装完，其它基本都不需要动了，除了稍微改改配置什么的。[MAMP安装地址](https://www.mamp.info/en/)   安装FREE免费版的就够了
>
> ![mamp使用演示](http://p1nd11vo8.bkt.clouddn.com/mamp_play.gif)
>
> 通过Preferences设置可以设置项目是用的是Apache还是Nginx，可以设置端口号，也可以设置是用PHP的版本号，然后可以将文件夹指向自己的项目，如果没有就新建一个，最后只需要点一下start即可。这样，一个完整的PHP环境就搭建好了！ （注： Nginx的还用不起来，如有熟知的，还望告知一下啊。）

参考链接：[mac环境下利用MAMP配置PHPStorm](https://www.jianshu.com/p/d58a84a42ea8)

##### 3.1 YII2简介

环境好了，接下来是不是得体验用一下，这里我们结合Yii2框架，因为工作中要用到，于是乎先来简单了解一下Yii2。官网在这里： [yiiframework](https://www.yiiframework.com/) 英文好的小伙伴，请直接阅读吧。这里我也简单附上我所查阅了解的：

> ##### YII简介 
>
> Yii 是一个高性能，基于组件的 PHP 框架，用于快速开发现代 Web 应用程序。
>
> ##### YII优点
>
> - 和其他 PHP 框架类似，Yii 实现了 MVC（Model-View-Controller）设计模式并基于该模式组织代码。
>
> - Yii 的代码简洁优雅，这是 Yii 的编程哲学。它永远不会为了要迎合某个设计模式而对代码进行过度的设计。
>
> - Yii 是一个全栈框架，提供了大量久经考验，开箱即用的特性，例如：对关系型和 NoSQL 数据库都提供了查询生成器（QueryBuilders）和 ActiveRecord；RESTful API 的开发支持；多层缓存支持，等等。
>
> - Yii 非常易于扩展。你可以自定义或替换几乎任何一处核心代码。你还会受益于它坚实可靠的扩展架构，使用、再开发或再发布扩展。
>
> - 高性能始终是 Yii 的首要目标之一。
>
>   ##### Yii 版本
>
>   Yii2的最新版本是 **2.0.15**，发布于 **2018年03月20日**。Yii 2.0 在 PHP 5.4.0 版本以上完全重写了 Yii，并且完全兼容 PHP 7.x。它的目的是成为一个最先进的新一代的PHP开发框架。Yii2.0不兼容1.1。2.0 版是一个完全重写的版本，采用了最新的技术和协议，包括依赖包管理器（Composer）、PHP 代码规范（PSR）、命名空间、Traits（特质）等等。 2.0 版代表了最新一代框架，是未来几年中我们的主要开发版本。所以，我们学习2.0版本。

##### 3.2 安装YII2

##### 1、使用composer安装

>[什么是Composer？](http://docs.phpcomposer.com/00-intro.html) 由于高墙的原因，会下载很慢，所以，这里我们使用[Composer中国镜像](http://pkg.phpcomposer.com/#tip1)。

##### 如何安装 Composer ?

> 启用本镜像服务，系统全局配置： 即将配置信息添加到 Composer 的全局配置文件 config.json 中。修改 composer 的全局配置文件**（推荐方式）**  打开命令行窗口（windows用户）或控制台（Linux、Mac 用户）并执行如下命令：

```
composer config -g repo.packagist composer https://packagist.phpcomposer.com
```

##### 下载 Composer

> 安装前请务必确保已经正确安装了 [PHP](http://php.net/)。打开命令行窗口并执行 `php -v` 查看是否正确输出版本号。

打开命令行并依次执行下列命令安装最新版本的 Composer：

```
php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');"
```

```
php composer-setup.php
```

```
php -r "unlink('composer-setup.php');"
```

>执行第一条命令下载下来的 `composer-setup.php` 脚本将简单地检测 `php.ini` 中的参数设置，如果某些参数未正确设置则会给出警告；然后下载最新版本的 `composer.phar` 文件到当前目录。
>
>上述 3 条命令的作用依次是：
>
>1. 下载安装脚本 － `composer-setup.php` － 到当前目录。
>2. 执行安装过程。
>3. 删除安装脚本。

这里推荐使用全局安装：

![Composer全局安装](http://p1nd11vo8.bkt.clouddn.com/Composer.png)

> 命令：sudo mv composer.phar /usr/local/bin/composer
>
> 然后，重新打开一个命令行窗口试一试执行 `composer --version` 看看是否正确输出版本号。
>
> 最后，提示：不要忘了经常执行 `composer selfupdate` 以保持 Composer 一直是最新版本哦！

##### 2、安装composer-asset-plugin插件

> 局部安装：

```
php composer.phar global require "fxp/composer-asset-plugin:~1.2.0"
```

> 如果你的Composer是全局安装的，那么就不需要输入`php composer.phar`，只需要用`composer`命令即可。

```
composer global require "fxp/composer-asset-plugin:~1.2.0"
```

> 安装这个，不然你会发现新增加好的项目中没有vendor目录

##### 3、下载yii

> 局部安装：

```
php composer.phar create-project --prefer-dist yiisoft/yii2-app-advanced advanced
```

> 全局安装方法：

```
composer create-project --prefer-dist yiisoft/yii2-app-advanced advanced 2.0.15
```

> 请注意，您可能会被提示安装过程中输入你的 GitHub 的用户名和密码。这是正常的。需要授权拉取的，只要输入它们并继续。

参考链接：[Yii 中文网下载](http://www.yiichina.com/download)   教程： [YII2快速学习笔记](https://segmentfault.com/a/1190000007976022)

> 在安装composer-asset-plugin的过程中，可能是由于网络的原因（明天接着安装吧。。。）：
>
> [Composer\Downloader\TransportException]                                   
>
> Content-Length mismatch, received 293497 bytes out of the expected 938084

![asset-plugin没安装成功](http://p1nd11vo8.bkt.clouddn.com/composer-asset-plugin.png)

一阵时间后，都不约而同地出现了红色异常提示：

>[Composer\Downloader\TransportException]                                   
>
>  Content-Length mismatch, received 293497 bytes out of the expected 938084

可能是网络问题吧，第二天早上就可以顺利下载了

![Yii2下载](http://p1nd11vo8.bkt.clouddn.com/yii2_install.png)

> 输入这个链接，在浏览器中打开，需要登录到自己的Github账户：
>
> https://github.com/settings/tokens/new?scopes=repo&description=Composer+on+zhaozhangdeMacBook-Pro.local+2018-04-12+0225

![access_token](http://p1nd11vo8.bkt.clouddn.com/access_token.png)

使用默认钩选即可，然后点击绿色的 Generate token ! 

![personal access](http://p1nd11vo8.bkt.clouddn.com/personal_access.png)

***这里一定要注意及时把这个刚生成的 access tokens 拷贝到终端命令行 Token (hidden): 处，否则，当前页面会话期一过的话或者刷新页面后，就可能再也看不到了，就得重新再创建过了。***

获取到Token授权之后，复制粘贴到这里：

>Head to https://github.com/settings/tokens/new?scopes=repo&description=Composer+on+zhaozhangdeMacBook-Pro.local+2018-04-12+0225   (注：点此链接去创建Token)
>
>to retrieve a token. It will be stored in "/Users/itworks/.composer/auth.json" for future use by Composer.
>
>Token (hidden):  **(注意这里是从Github获取到的授权Token)**
>
>Token stored successfully.
>
>Package operations: 63 installs, 0 updates, 0 removals     
>
>  - Installing yiisoft/yii2-composer (2.0.6): Downloading (100%)         
>
>  - Installing doctrine/lexer (v1.0.1): Downloading (100%)         
>
>  - Installing egulias/email-validator (2.1.4): Downloading (100%) 

前面的操作，会因网络情况，而出现不同的等待情况，输入完Token后，请务必耐心等待！！

##### 4、下载好YII后，初始化操作

如果你是类linux系统，切换到advanced目录执行php init命令进行初始化，如果你是windows系统，请双击advanced目录下的init.bat文件

>php init

![yii init](http://p1nd11vo8.bkt.clouddn.com/yii_init.png)



#### 5、 服务器配置

##### 1）更改hosts文件内容

>命令： sudo vim /etc/hosts
>
>添加：127.0.0.1       yiiwork.com

##### 2）更改apache服务器配置

>[MAMP配置虚拟主机](https://blog.csdn.net/it_r00t/article/details/75254933) 
>
>**一：打开终端（Terminal）或Iterm工具，首先用命令**
>
>> sudo vim /Applications/MAMP/conf/apache/httpd.conf 
>>
>> 打开Apache的配置文件找到
>
>**#Include /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf 取消注释，使配置虚拟主机的文件生效**
>
>**二：打开虚拟主机配置文件：**
>
>命令：sudo vim /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf
>
>在其中加入如下配置
>
><VirtualHost *:80>
>
>​    ServerAdmin lizhaozhang@xxx.im
>
>​    DocumentRoot "/Users/itworks/advanced/frontend/web"
>
>​    ServerName yiiwork.com
>
>​    ServerAlias yiiwork.com
>
>​    ErrorLog "logs/dummy-host.example.com-error_log"
>
>​    CustomLog "logs/dummy-host.example.com-access_log" common
>
>​    <Directory "/Users/itworks/advanced/frontend/web">
>
>​            Options Indexes FollowSymLinks MultiViews
>
>​            AllowOverride None
>
>​          #  Require all granted
>
>​    </Directory>
>
></VirtualHost>
>
>##### 三、修改项目目录访问权限
>
>命令： sudo chmod -R 777 /Users/itworks/advanced/
>
>##### 四、更改完成后需要重启Apache服务器
>
>配置完成后打开浏览器，输入配置的本地域名：http://yiiwork.com/   访问，成功了^_^
>
>

![yiiwork显示](http://p1nd11vo8.bkt.clouddn.com/yiiwork.png)



***Note:  期间遇到的一个问题，在先把MAMP Start Servers, 会弹窗报错：***

>Apache couldn't be started. Please check your MAMP installation and configuration. 
>
>这是因为我们设置的MAMP的Apache的端口也是80，MySQL使用的默认端口也是3306，
>
>我们用命令查看一下它们的端口和进程的占用情况：

```
sudo lsof -i:80		查看80端口的占用情况    ps aux | grep apache 查看进程
sudo lsof -i:3306	查看3306端口的占用情况  ps aux | grep mysqld 查看MySQL进程
kill -9 PID 	kill -9 pid <==> kill -s 9 pid，表示强制，尽快终止一个进程。
				多半admin会用这个命令。
```

>我们先把前面独立安装的MySQL和Apache给停了，然后再看端口的占用情况
>
>MySQL： 直接点击Stop MySQL Server
>
>Apache：sudo apachectl stop

但依旧未能正常启动MAMP中的MySQL服务，于是就

![查看端口和进程情况](http://p1nd11vo8.bkt.clouddn.com/port_process.png)

>没办法，只能去MAMP的MySQL运行日志中去寻找原因了

![mamp MySQL启动不了](http://p1nd11vo8.bkt.clouddn.com/mysql_start.png)

如果能够正常启动成功，会出现以下界面，并可以通过界面查看PHP安装环境及MySQL

![PHP安装环境及连接MySQL](http://p1nd11vo8.bkt.clouddn.com/mamp_start_server.png)

**因此，无论是在环境安装，还是在项目环境配置过程中，遇到问题，要学会去查看服务器和数据库的运行日志，从日志中发现问题，解决问题！！**

> 附MAMP的服务器软件安装目录，MAMP Logs路径：/Applications/MAMP/logs   下有
>
> apache_error.log	cloud_mamp.log	mysql_error_log.err	nginx_access.log	nginx_error.log
>
> 环境软件路径：
>
> cd /Applications/MAMP/Library/bin

由于本人本地项目环境，采用的是 Homebrew（即Nginx+Php+MySQL）, 以及PhpStorm和Git版本管理，因此，这里就不再对MAMP环境过多深入的篇幅，感兴趣的童靴，可以自行研究，或者私下交流。


##### 下一篇： Homebrew集成环境+PhpStorm与Yii2的最佳实践

