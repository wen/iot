mkdir -p /root/.ssh
cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys

curl -sfL https://get.k3s.io | sh -s - server \
	--write-kubeconfig-mode 644 \
	--advertise-address "192.168.42.110" \
	--node-ip "192.168.42.110"
