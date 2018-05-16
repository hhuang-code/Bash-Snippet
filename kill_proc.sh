#!/bin/sh

# Kill a process and its children processes
  
if [ $# -lt 1 ]; then  
  echo "usage: $0 pid"  
  exit 0  
fi  
  
function killProcess()   
{  
  for child in `ps -al | grep \\\\s$1\\\\s | awk '{print(\$4)}'|grep -v $1`  
  do  
    killProcess "$child"  
  done  
  kill -9 $1  
}  
  
killProcess "$1"
