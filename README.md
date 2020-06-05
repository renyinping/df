# Dockerfile

**一、手工构建Docker镜像**

#### 启动并进入容器模板
```
docker run -t -i --name=tpl ubuntu:18.04 bash
```

#### 安装软件包
```
apt-get update &&\
apt-get install -y sudo vim &&\
apt-get clean
```

#### 新建用户并赋予无密码超级权限
```
useradd -m openwrt &&\
echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt
```

#### 退出容器回到本机
```
exit
docker diff tpl #查看该容器进行了哪些修改
```

#### 提交镜像
```
docker commit -m "ubuntu 18.04" tpl yinping/ubuntu:18.04
```

#### 使用镜像
```
docker run -t -i --name=tpl yinping/ubuntu:18.04 sudo -iu openwrt bash
docker attach tpl
docker exec -ti tpl sudo -iu openwrt bash
```

#### 退出bash
1. Ctrl + d 退出并停止容器
2. Ctrl + p + q 退出并在后台运行容器

#### 推送镜像到仓库
```
docker login --username=yinping
docker push yinping/ubuntu:18.04
```

**二、Dockerfile构建**
```
docker build --rm -t yinping/ubuntu:18.04 .
```
