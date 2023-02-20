#!/usr/bin/env python3

from i3ipc import Connection

i3 = Connection()
tree = i3.get_tree()
focused = tree.find_focused()
workspace = focused.workspace()
floating_nodes = workspace.get('floating_nodes')
print(floating_nodes)
exit(0)
leaves = focused.workspace().leaves()
# get the start position of the screen
start = leaves[0].rect.x
current = focused.rect.x
index = current - start
print(index)
# print(focused.rect.x)
# print(focused.floating)
# print(focused.rect.x)

if focused.type == "floating_con":
    print(1)
    i3.command('kill')
elif len(leaves) < 2:
    i3.command('kill')
elif index < 100:
    i3.command('mark --add "_swap", focus right, swap container with mark "_swap", focus right, kill, focus left')
else:
    i3.command('kill')
    # count = 0
    # for leaf in leaves:
    #     if not leaf.is_floating():
    #         count += 1
    # print(count)

