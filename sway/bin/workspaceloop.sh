#!/bin/bash

current_monitor=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused==true).name')
current_monitor_ws=($(swaymsg -t get_workspaces | jq -r ".[] | select(.output==\"$current_monitor\") | .num"))
current_ws=$(swaymsg -t get_workspaces | jq '.[] | select(.focused==true) | .num')

echo $current_ws

length=${#current_monitor_ws[@]}
next_ws=0
case $1 in
  Left)
    for((i=0;i<$length;i++)) do
      ws=${current_monitor_ws[$i]}
      if [ $ws -eq $current_ws ]
      then
        if [ $i -eq 0 ]
        then
          next_ws_index=$((${#current_monitor_ws[@]}-1))
          next_ws=${current_monitor_ws[next_ws_index]}
          break
          else
          next_ws_index=$(($i-1))
          next_ws=${current_monitor_ws[next_ws_index]}
        fi
      fi
    done
    if [ $next_ws -eq $current_ws ]
    then
      exit
    fi
    swaymsg workspace $next_ws
    ;;
  Right)
    for((i=0;i<$length;i++)) do
      ws=${current_monitor_ws[$i]}
      if [ $ws -eq $current_ws ]
      then
        last_index=$(($length-1))
        if [ $i = $last_index ]
        then
          next_ws_index=0
          next_ws=${current_monitor_ws[next_ws_index]}
          break
        else
          next_ws_index=$(($i+1))
          next_ws=${current_monitor_ws[next_ws_index]}
        fi
      fi
    done
    if [ $next_ws -eq $current_ws ]
    then
      exit
    fi
    swaymsg workspace $next_ws
    ;;
esac
