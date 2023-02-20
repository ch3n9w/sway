#!/usr/bin/python
import subprocess
import json

def get_windows_of_current_workspace():
    command="swaymsg -t get_tree"

    get_ws = "swaymsg -t get_workspaces | jq -r '.[] | select(.focused==true).name'"
    process = subprocess.Popen(get_ws,shell=True,stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    current_ws = process.communicate()[0][:-1].decode("utf-8")
    
    
    process = subprocess.Popen(command,shell=True,stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    result = process.communicate()[0]
    data = json.loads(result)

    # Select outputs that are active
    windows = []
    for output in data['nodes']:
        # The scratchpad (under __i3) is not supported
        if output.get('name') != '__i3' and output.get('type') == 'output':
            workspaces = output.get('nodes')
            for ws in workspaces:
                if ws.get('type') == 'workspace' and ws.get('name') == current_ws: 
                    windows += extract_nodes_iterative(ws)
    return windows

# Extracts all windows from a sway workspace json object 
def extract_nodes_iterative(workspace):
    all_nodes = []
    floating_nodes = workspace.get('floating_nodes')
    for floating_node in floating_nodes:
        all_nodes.append(floating_node)
    nodes = workspace.get('nodes')
    for node in nodes:
        # Leaf node
        if len(node.get('nodes')) == 0:
            all_nodes.append(node)
        # Nested node, handled iterative
        else:
            for inner_node in node.get('nodes'):
                nodes.append(inner_node)
    return all_nodes

windows = get_windows_of_current_workspace()
first_flag = 0
start = 0

if len(windows) < 2:
    exit(0)

for window in windows:
    # print(window)
    # get the start rect from the first window
    if first_flag == 0:
        start = window.get('rect').get('x')
        first_flag = 1

    if window.get('focused'):
        pos = window.get('rect').get('x')
        index = pos - start
        id = (window.get('id'))
        if index < 100:
            command = '''swaymsg 'mark --add "_swap", focus right, swap container with mark "_swap", focus right, unmark "_swap"' '''
        else:
            command = '''swaymsg 'mark --add "_swap", focus left, swap container with mark "_swap", focus left, unmark "_swap"' '''
        process = subprocess.Popen(command,shell=True)


