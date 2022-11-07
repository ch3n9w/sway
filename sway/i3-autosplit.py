from i3ipc import Connection, Event

i3 = Connection()
# Dynamically change the split direction on window focus
def on_window_focus(i3, e):
    focused_window = e.container
    full=bool(focused_window.fullscreen_mode)
    if(not full):
        if(focused_window.rect.width>focused_window.rect.height):
            # set split to horizontal
            i3.command('split horizontal')
        else:
            # set split to vertical          
            i3.command('split vertical')

# Subscribe to events
i3.on(Event.WINDOW_FOCUS, on_window_focus)
i3.main()
