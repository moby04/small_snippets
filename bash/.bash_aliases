alias cd..="cd .."

vpnRoute() {
	DEVICE="$1"
	
	if [ $# != 1 ]; then
		echo "Usage: vpnRoute <device>"
		return 1
	fi;
	
	if [ `ip addr | grep " $DEVICE:" | wc -l` = 0 ]; then
		echo "Provided device ($DEVICE) not found"
		return 1
	fi;
	
	sudo ip route add $(dig wiki.sitewards.net +short)/32 via 192.168.4.1 dev $DEVICE
}

dockerStop() {
	if [ $# -gt 0 ]; then
		docker ps -a |grep -v IMAGE | grep $@ | grep -v Exited | awk '{print $1}' | xargs docker stop
	else
		docker ps -a |grep -v IMAGE | grep -v Exited | awk '{print $1}' | xargs docker stop
	fi
}

dockerRemove() {
	docker rm $(docker ps -a -q) && docker rmi --force $(docker images -q)
}
