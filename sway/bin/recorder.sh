#!/bin/bash
#
check=$(pgrep wf-recorder)
if [ -z "$check"] 
then
  rm /tmp/recorder.gif
  notify-send "Recorder Start"
  wf-recorder -g "$(slurp)" -F fps=30 -c gif -f /tmp/recorder.gif
  wl-copy < /tmp/recorder.gif 
else
  pkill --signal SIGINT wf-recorder
  notify-send "Recorder End"
fi
