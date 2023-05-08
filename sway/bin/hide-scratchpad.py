from i3ipc import Connection
import subprocess

i3 = Connection()
focused_workspace = i3.get_tree().find_focused().workspace()
focused_scratchpad = i3.get_tree().scratchpad()
leaves = focused_scratchpad.leaves()
# after experiment, leaves will be [] if scratchpad show
if len(leaves) == 0:
    command="swaymsg scratchpad show"
    process = subprocess.Popen(command,shell=True,stdout=subprocess.PIPE, stderr=subprocess.PIPE)
