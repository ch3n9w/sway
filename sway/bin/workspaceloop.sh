#!/bin/bash

current_ws=$(swaymsg -t get_workspaces | jq '.[] | select(.focused==true) | .num')

direction=$1
workspace_maintained=0
active_workspace=($(swaymsg -t get_workspaces | jq '.[] | .num'))
active_workspace_without_maintained=()

length=${#active_workspace[@]}
for((i=0;i<$length;i++)) do
  ws=${active_workspace[$i]}
  if [ $ws = $workspace_maintained ]
  then
    continue
  fi
  active_workspace_without_maintained+=($ws)
done

length=${#active_workspace_without_maintained[@]}
next_ws=0
case $1 in
  Left)
    for((i=0;i<$length;i++)) do
      ws=${active_workspace_without_maintained[$i]}
      if [ $ws = $current_ws ]
      then
        if [ $i = 0 ]
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
    swaymsg workspace $next_ws
    ;;
  Right)
    for((i=0;i<$length;i++)) do
      ws=${active_workspace_without_maintained[$i]}
      if [ $ws = $current_ws ]
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

    swaymsg workspace $next_ws
    ;;
esac
