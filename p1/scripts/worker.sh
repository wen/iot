mkdir -p /root/.ssh
mv /tmp/id_rsa  /root/.ssh

echo "192.168.42.110 yewenS" >> /etc/hosts

scp -o StrictHostKeyChecking=no root@yewenS:/var/lib/rancher/k3s/server/token /tmp/token

curl -sfL https://get.k3s.io | sh -s - agent \
	--server "https://yewenS:6443" \
	--token-file "/tmp/token" \
	--node-ip="192.168.42.111"
