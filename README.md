# androidV8
构建android使用的v8引擎

. 第一步 初始化docker环境
```
#下载https://raw.githubusercontent.com/jinhan1414/androidV8/master/initDocker.sh并执行
./initDocker.sh
```

. 第二步 构建编译v8引擎的docker镜像并推送到阿里云镜像中心
```
下载https://raw.githubusercontent.com/jinhan1414/androidV8/master/buildDockerImage.sh并执行
./buildDockerImage.sh
```

. 第三步 在本机拉取docker镜像
1、登录阿里云镜像中心
docker login --username=${aliyun_username} registry.cn-chengdu.aliyuncs.com --password=${aliyun_password}
2、拉取指定版本镜像
docker pull registry.cn-chengdu.aliyuncs.com/jinchengsong001/android_v8:xxx

. 第四步 编译v8引擎
1、启动docker镜像

2、执行buildAndroidV8.sh

