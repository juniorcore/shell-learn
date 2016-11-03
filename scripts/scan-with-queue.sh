#!/bin/bash

#declare -i NPROC

for users in `cat /root/bin/usertest.txt`; 
do
    clamscan -ir /home/$users --move=/home/$users/malware &
    NPROC="$(ps aux | grep "clamscan -ir" | wc -l)";
    printf "process = $NPROC";
    if [ "$NPROC" -ge 2 ]; then
    	wait
    else
    	clamscan -ir /home/$users --move=/home/$users/malware &
    fi
done

echo "scan done"
exit 0