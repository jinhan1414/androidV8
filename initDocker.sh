echo "开始卸载docker并移除历史数据"
systemctl stop docker
yum -y remove containerd.io.x86_64
yum -y remove docker-ce-cli.x86_64
rm -rf /var/lib/docker 
echo "docker卸载完成"

echo "开始安装docker"
yum -y install docker-ce
systemctl start docker.service
echo "安装docker完成"
