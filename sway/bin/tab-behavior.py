#!/usr/bin/env python3

from i3ipc import Connection

i3 = Connection()
tree = i3.get_tree()
focused = tree.find_focused()
leaves = focused.workspace().leaves()
# print(leaves[0].focused)
# print(focused.rect.x)

if focused.floating:
    i3.command('mark --add "_swap", focus left, swap container with mark "_swap", focus left, unmark "_swap"')
elif len(leaves) < 2:
    i3.command('workspace back_and_forth')
elif focused.rect.x < 100:
    i3.command('mark --add "_swap", focus right, swap container with mark "_swap", focus right, unmark "_swap"')
else:
    i3.command('mark --add "_swap", focus left, swap container with mark "_swap", focus left, unmark "_swap"')
    # count = 0
    # for leaf in leaves:
    #     if not leaf.is_floating():
    #         count += 1
    # print(count)

