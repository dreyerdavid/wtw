# wtw
NGINX project


##Run the following commands to Install and configure Salt-Minion on the target node:
apt-get --yes -q install python-software-properties
add-apt-repository ppa:saltstack/salt
apt-get --yes -q update
apt-get --yes -q install salt-minion
## Update the Salt Master IP address and restart the Salt-Minion service.
## Accept Minion's key on Master:
salt-key -L
salt-key -a <new minion key name>