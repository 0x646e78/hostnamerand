#! /bin/sh
### BEGIN INIT INFO
# Provides:          hostnamerand
# Required-Start:    
# Required-Stop:     $local_fs hostname
# Should-Start:      glibc
# Default-Start:      
# Default-Stop:	     0 6
# Short-Description: Sets a random hostname from a word file.
# Description:       Reads a word list at shutdown, and sets the 
#		     files /etc/hostname and /etc/hosts with the 
#		     new hostname, to be loaded at startup by 
#		     /etc/init.d/hostname.sh
# Author:	     auraltension
### END INIT INFO

PATH=/sbin:/bin:/usr/bin

WORDLIST="/usr/share/dict/hostnames"
CUR_HOSTNAME=$(hostname)
RAND_HOSTNAME=$(shuf -n 1 $WORDLIST | sed 's/'"'"'//')

do_status () {
	HOSTNAME=$(hostname)
	if [ "$HOSTNAME" ] ; then
		return 0
	else
		return 4
	fi
}

case "$1" in
  stop|"")
	echo $RAND_HOSTNAME > /etc/hostname
	hostname $RAND_HOSTNAME
	sed -i 's/'"$CUR_HOSTNAME"'/'"$RAND_HOSTNAME"'/g' /etc/hosts
	;;
  restart|reload|force-reload)
	echo "Error: argument '$1' not supported" >&2
	exit 3
	;;
  start)
	# No-op
	;;
  status)
	do_status
	exit $?
	;;
  *)
	echo "Usage: hostnamerand.sh [stop]" >&2
	exit 3
	;;
esac

:
