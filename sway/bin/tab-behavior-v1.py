#!/usr/bin/env python3

from i3ipc import Connection

i3 = Connection()
tree = i3.get_tree()
focused = tree.find_focused()
leaves = focused.workspace().leaves()
# get the start position of the screen
start = leaves[0].rect.x
current = focused.rect.x
index = current - start
# print(leaves[0].focused)
# print(focused.rect.x)

# waiting for sway support floating detect
# i3.command('floating disable')
if len(leaves) < 2:
    i3.command('workspace back_and_forth')
elif index < 100:
    i3.command('mark --add "_swap", focus right, swap container with mark "_swap", focus right, unmark "_swap"')
else:
    i3.command('mark --add "_swap", focus left, swap container with mark "_swap", focus left, unmark "_swap"')
    # count = 0
    # for leaf in leaves:
    #     if not leaf.is_floating():
    #         count += 1
    # print(count)

