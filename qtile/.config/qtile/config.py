from libqtile.config import Screen, Match, Drag, Click
from libqtile import bar, widget, layout, hook
from libqtile.lazy import lazy

from key import init_keys

import os
import subprocess

keys = init_keys()

layouts = [
    layout.Columns(border_width=1),
    layout.Max(),
    #layout.Stack(stacks=2)
]

topBar=[
        widget.GroupBox(
            highlight_method='block',
            other_current_screen_border='FFBF00',
            other_screen_border='282828',
            this_screen_border='1F1F1F',
            active="FFFFFF",
            hide_unused=True,
            ),
        widget.Spacer(),
        widget.Volume(
            get_volume_command='pactl get-sink-volume @DEFAULT_SINK@ | head -n 1| awk -F \'/\' \'{gsub(" ","",$0); print $2}\'',
            volume_down_command='pactl set-sink-volume @DEFAULT_SINK@ -2%',
            volume_up_command='pactl set-sink-volume @DEFAULT_SINK@ +2%',
            volume_app="pavucontrol",
            unmute_format=" {volume}%",
            check_mute_command="pactl get-sink-mute @DEFAULT_SINK@",
            check_mute_string="Mute: yes",
            mute_command="pactl set-sink-mute @DEFAULT_SINK@ toggle",
            mute_format=" Vol"
            ),
        widget.Sep(foreground='FFBF00'),
        widget.CPU(
            format="󰻠 {load_percent}%@{freq_current}Ghz",
            mouse_callbacks={
                'Button1': lazy.spawn('kitty --title btop sh -c \'btop\' &')
                }
            ),
        widget.ThermalSensor(
            threshold=55.0,
            tag_sensor='Package id 0',
            format=" {temp:.1f}{unit}"
            ),
        widget.Memory(measure_mem='G',fmt="  {}"),
        widget.Sep(foreground='FFBF00'),
        widget.Pomodoro(),
        widget.Systray(hide_crash=True),
        widget.Sep(foreground='FFBF00'),
        widget.Clock(
            format="%a %d %b @ %I:%M %p"
            ),
]

screens = [
    Screen(
            top = bar.Bar(topBar,25)
        )
]

# Floating Rules
floating_layout = layout.Floating(
        float_rules=[
            *layout.Floating.default_float_rules,
            Match(wm_class="pavucontrol"),
            Match(title="btop"),
            Match(title="bitwarden")
        ]
    )

# Default config
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
auto_minimize = True

# Mouse
# Drag floating layouts.
mouse = [
    Drag(['mod4'], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag(['mod4'], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click(['mod4'], "Button2", lazy.window.bring_to_front()),
]


# Hook
@hook.subscribe.startup_once
def autostart():
    monitor = os.path.expanduser("~/.screenlayout/qtile-3.sh")
    subprocess.Popen([monitor])
    script = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.Popen([script])
