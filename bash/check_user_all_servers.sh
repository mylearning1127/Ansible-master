#!/bin/bash

# checking User available or not

for user in `cat /tmp/user_list`
do
echo $user
	for server in `cat /tmp/server_list`
	do	
	   status=`ssh -qo "stricthostkeychecking=no" root@${server} ls -lrt /home/ | awk '{print $9}' | grep -i ${user}`
           if [ "$status" != "$user"  ]; then
            echo "${server}              =  don't have user =  $user"
	   fi
        done
 echo "------------------------"

done
