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

alias sshi="ssh -o IdentitiesOnly=yes -i" 

alias azdocker="docker run -it microsoft/azure-cli"
