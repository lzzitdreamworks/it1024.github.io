
---
title: Php开发环境独立安装与Yii2框架配置
date: 2018-04-14 11:10:10
tags: MacOS Unix Apache Php MySQL Yii2
---

#### 二、MacOS内置的PHP开发环境（独立安装）

#### **2.1、运行Apache**

> 好了，该进入正文了。先来看看装备的耐草指数吧：
>
> ![MackBookPro系统参数：](http://p1nd11vo8.bkt.clouddn.com/macprosystem.png)
>
> 这里主要是想说明，系统配置的差异，会对电脑自带的环境及参数有差异，但对我们的开发和后面的环境搭建和配置基本是没什么影响的。要感谢公司哈，好好准备物尽其用吧～。

> 首先，我们可以先打开终端，至于Mac怎么打开终端还不熟悉的童鞋，请自行百度哦。由于MacOS中已经内置了PHP，Python，Ruby等常用的脚本语言，以及ApacheHTTP服务器，我们可以通过终端输入以下命令来查看（既然有内置的，我们也来用用呗，没有比较就没有选择嘛）:  ![查看内置的php+apache版本](http://p1nd11vo8.bkt.clouddn.com/check_version.png)

> [mac终端普通用户切换root用户](https://blog.csdn.net/tanga842428/article/details/70193835)
>
> xxx is not in the sudoers file.This incident will be reported.的解决方法:
>
> [xxx is not in the sudoers file的解决办法](https://www.aliyun.com/jiaocheng/185436.html)

![mac终端普通用户切换root](http://p1nd11vo8.bkt.clouddn.com/root_pwd.png)

![普通用户切换成root](http://p1nd11vo8.bkt.clouddn.com/user_sudo.png)

> su - 用户名 (-和用户名之间有英文半角空格) 切换回普通用户，eg.  **su - itworks** （这里itworks换成你们自己的用户名）	[Mac下快速搭建PHP开发环境](https://blog.csdn.net/cgema/article/details/72457985)

![开启apache并测试](http://p1nd11vo8.bkt.clouddn.com/apache_start.png)

> 常用命令：
>
> ```
> sudo apachectl -v	查看Apache版本
> sudo apachectl start	开启Apache
> sudo apachectl stop		关闭Apache
> sudo apachectl restart	重启Apache
> ```



#### 2.2、配置PHP

![配置php7](http://p1nd11vo8.bkt.clouddn.com/config_php7.png)

编辑Apache的配置文件，终端输入：

```
sudo vi /etc/apache2/httpd.conf
```

找到：

```
#LoadModule php7_module libexec/apache2/libphp7.so
```

去掉前面的“#”号注释，然后 :wq 保存退出即可

复制一份php.ini.default并将其命名为php.ini即可

```
sudo cp /etc/php.ini.default /etc/php.ini
```

重启Apache，使其生效

```
sudo apachectl restart
```

测试apache与php之间的通信：

![apache与php通信](http://p1nd11vo8.bkt.clouddn.com/apache_php.png)

没问题了以后，就可以在这里写写测试Demo了^_^

#### 2.3、安装并运行MySQL

下载MySQL：[MySQL官网](https://dev.mysql.com/downloads/mysql/)   下载后双击安装，成功之后，会弹出提示框：

> MySQL: 2018-04-03T08:30:17.852818Z 1  [**Note**] **A temporary password is generated for root@localhost: ?B**(**dL+ge**)**1Je**   ***注：localhost冒号后面的就是 MySQL临时登录密码）***
>
> If you lose this password**, **please consult the section How to Reset the Root Password in the MySQL reference manual.**
>
> 从弹窗中Copy记住这个密码，并保存起来，以备初次登录使用。

[mac安装mysql的两种方法（含配置）](https://www.jianshu.com/p/fd3aae701db9)  

启动MySQL使之处于running状态：

![启动MySQL](http://p1nd11vo8.bkt.clouddn.com/local_mysql.png) 

mac下mysql terminal命令行设置以及常规用法：

> 首先正常使用时，需要找到MySQL所在bin目录，例如：
>
> 1. $ /usr/local/mysql/bin/mysql -u root -p  
>
> 2. Enter password:   
>
> 3. 通过mysql -uroot -p登录mysql, 输入之前保存的密码，然后重置mysql初始密码 
>
>    （PS: 我个人觉得这应该是最简单方便的修改MySQL初始密码的方式了）
>
>    原理是修改database：mysql 的table：user 中的User字段为root的密码，5.7版本的mysql的密码字段是authentication_string，低版本的叫password;
>
>    ```
>    SET PASSWORD FOR 'root'@'localhost' = PASSWORD('newpassword');  
>    刷新权限，退出重启：
>    MySQL> flush privileges;
>    MySQL> quit;
>    终端：service mysql start
>    密码修改完成
>    ```

至于像网上所说的 [mac下修改mysql的密码](https://blog.csdn.net/pariese/article/details/77527813) 的各种方式，我暂时还没有一一试过。所涉及的

> vim ~/.bash_profile  	我当前的it_works用户下并没有该文件，可以使用
>
> **find / -name .bash_profile**	命令查找，发现是在管理员用户目录下：
>
> /Users/zhaozhangli/.bash_profile

![MySQL第一次登录](http://p1nd11vo8.bkt.clouddn.com/mysql_login.png)

这里可以使用SQL:  mysql> select version();  查看版本号

![修改初始密码](http://p1nd11vo8.bkt.clouddn.com/modify_pwd.png)   

[mac下mysql terminal命令行设置以及常规用法](http://p1nd11vo8.bkt.clouddn.com/apache_start.png)  

注意：Automatically Start MySQL Server On Startup是默认勾选的，勾选后打开电脑会默认开启MySQL，建议不需要的可以不用默认勾选。至于这里为什么独立安装一个相对新版的MySQL 5.7.21，当然是为了体验新版本所带来的新技术和新特性了。这里想尝鲜或者想当第一个吃螃蟹的小伙伴，可以先看下这个友情链接：

[MySQL 5.7 新特性大全和未来展望](http://www.cnblogs.com/nulige/articles/6880535.html)

嫌终端查看数据库不方便的，可以下载Navicat Lite管理软件，管理MySQL超级方便。后面的教程会再详细介绍。

至此，利用MacOS系统内置的Apache+MySQL+PHP的独立开发环境已经安装完毕，暂告一段落了！

##### 下一篇：MAMP集成环境使用与Yii2框架配置



