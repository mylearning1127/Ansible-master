#!/bin/bash

servername=$1
Report_dir=/tmp
Filename=${servername}_precheck.log
Mounted_FS_count=`cat $Report_dir/${Filename} | tail -n 1 | grep -o '[[:digit:]]*'`
df -h | awk '{print $6}' > /tmp/mountpoint_list

for((i=1; i<=${Mounted_FS_count}; i++)); do
  ans=`expr 2 \* $i`
  Precheck_mount=`cat $Report_dir/${Filename} | sed -n '/output of "Mounts"/,/output of "IP address" :/p' | grep -v output | grep -v "-"  | cut -d "'" -f${ans} | grep -v '^$' | head -n 1`
  compare_mount=`cat /tmp/mountpoint_list | grep -i $Precheck_mount`

  if [ ! -z "${compare_mount}" ]; then
     echo "$Precheck_mount is available"
  else
     echo "$Precheck_mount is not avilable"  
  fi
done
