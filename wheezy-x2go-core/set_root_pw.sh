#!/bin/bash

if [ -f /.root_pw_set ]; then
	echo "Root password already set!"
	exit 0
fi

ROOT_PASS=${ROOT_PASS:-$(pwgen -s 12 1)}
_word=$( [ ${ROOT_PASS} ] && echo "preset" || echo "random" )
echo "=> Setting a ${_word} password to the root user"
echo "root:$ROOT_PASS" | chpasswd

adduser --disabled-password --gecos "" dockerx 
adduser dockerx sudo

PASS=${PASS:-$(pwgen -s 12 1)}
_pword=$( [ ${PASS} ] && echo "preset" || echo "random" )

echo "=> Setting a ${_pword} password to the dockerx user"
echo "dockerx:$PASS" | chpasswd


echo "=> Done!"
touch /.root_pw_set

echo "========================================================================"
echo "You can now connect to this Ubuntu container via SSH using:"
echo ""
echo "    ssh -p <port> root@<host>"
echo "and enter the root password '$ROOT_PASS' when prompted"
echo ""
echo " dockerx password : $PASS "
echo "use this to connect to the x2go server from your x2go client!"
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"
