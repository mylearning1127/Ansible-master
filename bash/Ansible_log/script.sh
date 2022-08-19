#!/bin/bash

log=$1

# working fine
cat $log | grep -i "ok=3" | awk '{print $1}' | cut -d "." -f1  > working_fine.log

# Unreachable
cat $log | grep -i "ok=0" | awk '{print $1}' | cut -d "." -f1  > unreachable.log

#host not found
cat $log | grep -i "cloud not match supplied host pattern" | awk '{print $9}' | cut -d "*" -f1 > host_not_found.log 

# sudo|interpreter

cat $log | grep -i fatal | egrep -i "sudo|interpreter" | cut -d "]" -f1 | cut -d "[" -f2  | cut -d "." -f1> sudo_interpreter.log
