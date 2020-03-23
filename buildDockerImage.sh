aliyun_username=xxxx
aliyun_password=xxxx
image_name=android-v8-build-env
image_version=2.0
mkdir dock
cd dock
wget https://raw.githubusercontent.com/jinhan1414/androidV8/master/Dockerfile
sudo docker login --username=${aliyun_username} registry.cn-chengdu.aliyuncs.com --password=${aliyun_password}
docker images
sudo docker build -t ${image_name}:${image_version} .
sudo docker tag ${image_name}:${image_version} registry.cn-chengdu.aliyuncs.com/jinchengsong001/chengdu:${image_version}
sudo docker push registry.cn-chengdu.aliyuncs.com/jinchengsong001/chengdu:${image_version}   
