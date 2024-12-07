from libqtile.config import Key, Drag, Click, Group
from libqtile.lazy import lazy
from libqtile.extension import DmenuRun
# Key Definition
#
mod = "mod4"
shift = "shift"
alt = "mod1"
ctrl = "control"

def init_groups():
    return [
        Group(name="1", label="Browser"),
        Group(name="2", label="2"),
        Group(name="3", label="3"),
        Group(name="4", label="4"),
        Group(name="5", label="5"),
        Group(name="6", label="6"),
        Group(name="7", label="7"),
        Group(name="8", label="8"),
        Group(name="9", label="<>"),
        Group(name="0", label="%"),
    ]

def group_keys():
    available_keys = ['1','2','3','4','5','6','7','8','9','0']
    keys = []
    
    for key, group in enumerate(init_groups()):
        if key < len(available_keys):
            keys.extend([
                Key([mod], available_keys[key], lazy.group[group.name].toscreen()),
                Key([mod,shift], available_keys[key], lazy.window.togroup(group.name))
            ])
        else:
            break

    return keys


def init_keys():
    keys = [
        Key([mod], "return", lazy.spawn(['kitty']), desc="Run Terminal (Kitty)"),
        Key([mod], 'space', lazy.spawn("rofi -show drun -p 'Application: ' -theme '~/.config/rofi/app.rasi'"), desc="Application menu" ),

        # Print screen
        Key([mod], "p", lazy.spawn("flameshot gui"), desc="Print screen"),
        # QTile Control
        Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
        Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
        Key([mod, ctrl], "r", lazy.reload_config(), desc="Reload the config"),
    ]

    keys.extend(group_keys())
    return keys
