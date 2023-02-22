#!/bin/bash
#
#This script is used to skip workspace on one monitor

current_ws=$(swaymsg -t get_workspaces | jq '.[] | select(.focused==true) | .num')

direction=$1
monitor_workspace=$2
active_workspace=($(swaymsg -t get_workspaces | jq '.[] | .num'))
active_workspace_without_maintained=()

length=${#active_workspace[@]}
for((i=0;i<$length;i++)) do
  ws=${active_workspace[$i]}
  if [ $ws -eq $monitor_workspace ]
  then
    continue
  fi
  active_workspace_without_maintained+=($ws)
done

length=${#active_workspace_without_maintained[@]}
next_ws=0
case $1 in
  Left)
    if [ $current_ws = $monitor_workspace ]
    then
      swaymsg workspace prev
    else
      for((i=0;i<$length;i++)) do
        ws=${active_workspace_without_maintained[$i]}
        if [ $ws -eq $current_ws ]
        then
          if [ $i -eq 0 ]
          then
            next_ws_index=$((${#active_workspace_without_maintained[@]}-1))
            next_ws=${active_workspace_without_maintained[next_ws_index]}
            break
            else
            next_ws_index=$(($i-1))
            next_ws=${active_workspace_without_maintained[next_ws_index]}
          fi
        fi
      done
      if [ $next_ws -eq $current_ws ]
      then
        exit
      fi
      swaymsg workspace $next_ws
    fi
    ;;
  Right)
    if [ $current_ws -eq $monitor_workspace ]
    then
      swaymsg workspace next
    else
      for((i=0;i<$length;i++)) do
        ws=${active_workspace_without_maintained[$i]}
        if [ $ws -eq $current_ws ]
        then
          last_index=$(($length-1))
          if [ $i = $last_index ]
          then
            next_ws_index=0
            next_ws=${active_workspace_without_maintained[next_ws_index]}
            break
          else
            next_ws_index=$(($i+1))
            next_ws=${active_workspace_without_maintained[next_ws_index]}
          fi
        fi
      done
      if [ $next_ws -eq $current_ws ]
      then
        exit
      fi
      swaymsg workspace $next_ws
    fi
    ;;
esac
