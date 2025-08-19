from subprocess import Popen
import os

from libqtile import bar, hook, layout, qtile, widget
from libqtile.config import Click, Drag, DropDown, Group, Key, Match, ScratchPad, Screen
from libqtile.lazy import lazy
from libqtile import hook


# ---------------
#   Bindings
# ---------------
# Modifiers
SUPER = "mod4"

# shortcut set
WIN = ["mod4"]
ALT = ["mod1"]
WIN_SHT = ["mod4", "shift"]
WIN_CTRL = ["mod4", "control"]

HOME = os.environ.get("HOME")
TERMINAL = os.environ.get("TERMINAL")
BROWSER = os.environ.get("BROWSER")
FILEMANAGER = os.environ.get("FILEMANAGER")


def navigate_floating(qtile):
    qtile.current_group.next_window()
    qtile.current_window.bring_to_front()


def toggle_margin(self):
    current_bar = qtile.current_screen.top
    if self.current_layout.margin > 0 or self.current_layout.margin_on_single > 0:
        self.current_layout.margin = 0
        self.current_layout.margin_on_single = 0
        current_bar.margin = [0, 0, 0, 0]
    else:
        self.current_layout.margin = 5
        self.current_layout.margin_on_single = 5
        current_bar.margin = [5, 5, 0, 5]

    current_bar._configure(qtile, qtile.current_screen, True)
    qtile.current_group.layout_all()


# Keyboard bindings
keys = [
    # Window focus
    Key(WIN, "h", lazy.layout.left()),
    Key(WIN, "l", lazy.layout.right()),
    Key(WIN, "j", lazy.layout.down()),
    Key(WIN, "k", lazy.layout.up()),
    Key(WIN, "space", lazy.layout.next()),
    Key(WIN_SHT, "n", lazy.layout.normalize()),
    Key(WIN_SHT, "space", lazy.layout.swap_column_left()),
    Key(ALT, "tab", lazy.function(navigate_floating)),
    # Move window position
    Key(WIN_SHT, "h", lazy.layout.shuffle_left()),
    Key(WIN_SHT, "l", lazy.layout.shuffle_right()),
    Key(WIN_SHT, "k", lazy.layout.shuffle_up()),
    Key(WIN_SHT, "j", lazy.layout.shuffle_down()),
    Key(WIN_SHT, "Return", lazy.layout.toggle_split()),
    # Grow window
    Key(WIN, "comma", lazy.layout.grow_left()),
    Key(WIN, "period", lazy.layout.grow_right()),
    Key(WIN_SHT, "comma", lazy.layout.grow_down()),
    Key(WIN_SHT, "period", lazy.layout.grow_up()),
    # Qtile specific
    Key(WIN, "r", lazy.reload_config()),
    Key(WIN_SHT, "r", lazy.restart()),
    Key(WIN_SHT, "q", lazy.shutdown()),
    # Run specific program
    Key(WIN, "Return", lazy.spawn(TERMINAL)),
    Key(WIN, "p", lazy.spawn("launcher")),
    Key(WIN, "Print", lazy.spawn("shot")),
    Key(WIN, "b", lazy.spawn(BROWSER)),
    Key(WIN, "e", lazy.spawn(FILEMANAGER)),
    Key(
        ALT,
        "shift_l",
        lazy.widget["keyboardlayout"].next_keyboard(),
    ),
    # Window command
    Key(WIN, "q", lazy.window.kill()),
    Key(WIN, "f", lazy.window.toggle_floating()),
    Key(WIN_SHT, "f", lazy.window.toggle_fullscreen()),
    Key(WIN_SHT, "m", lazy.window.toggle_maximize()),
    # Screen specific
    Key(WIN_SHT, "b", lazy.hide_show_bar()),
    # Layout specific
    Key(WIN, "grave", lazy.next_layout()),
    Key(WIN_SHT, "grave", lazy.prev_layout()),
    Key(WIN, "m", lazy.group.setlayout("max")),
    Key(WIN, "c", lazy.group.setlayout("columns")),
    Key(WIN, "g", lazy.function(toggle_margin)),
    # Group (workspace)
    Key(WIN, "bracketright", lazy.screen.next_group(skip_empty=True)),
    Key(WIN, "bracketleft", lazy.screen.prev_group(skip_empty=True)),
    Key(WIN, "Tab", lazy.screen.toggle_group()),
    Key(WIN, "1", lazy.group["1"].toscreen()),
    Key(WIN, "2", lazy.group["2"].toscreen()),
    Key(WIN, "3", lazy.group["3"].toscreen()),
    Key(WIN, "9", lazy.group["9"].toscreen()),
    Key(WIN, "0", lazy.group["0"].toscreen()),
    Key(WIN_SHT, "1", lazy.window.togroup("1", switch_group=False)),
    Key(WIN_SHT, "2", lazy.window.togroup("2", switch_group=False)),
    Key(WIN_SHT, "3", lazy.window.togroup("3", switch_group=False)),
    Key(WIN_SHT, "9", lazy.window.togroup("9", switch_group=False)),
    Key(WIN_SHT, "0", lazy.window.togroup("0", switch_group=False)),
    Key(WIN_SHT, "p", lazy.group["scratchpad"].dropdown_toggle("python")),
    Key(WIN_SHT, "t", lazy.group["scratchpad"].dropdown_toggle("terminal")),
    # Volume keys
    Key([], "XF86AudioRaiseVolume", lazy.spawn("volume inc")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("volume dec")),
    Key([], "XF86AudioMute", lazy.spawn("volume mute")),
]

# Mouse bindings
mouse = [
    Drag(
        WIN,
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        WIN,
        "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size(),
    ),
    Click(WIN, "Button1", lazy.window.bring_to_front()),
]

# ---------------
#   Core
# ---------------

color = {
    "bg": "#121212",
    "fg": "#c1c1c1",
    "active": "#fafafa",
    "inactive": "#212121",
    "primary": "#984936",
    "secondary": "#788890",
}

# ------------------
#     GROUP
# ------------------
# keyword arguments for `python` scratchpad
spad_kw = dict(x=0.16, y=0.1, width=0.7, height=0.7, opacity=1)
groups = [
    Group(name="1", label="1"),
    Group(
        name="2",
        label="2",
        layout="max",
        matches=[
            Match(wm_class="Firefox"),
            Match(wm_class="Brave-browser"),
        ],
    ),
    Group(name="3", label="3"),
    Group(
        name="9",
        label="9",
        layout="max",
        matches=[
            Match(wm_class="TelegramDesktop"),
            Match(wm_class="obsidian"),
        ],
    ),
    Group(
        name="0",
        label="0",
        layout="max",
        matches=[
            Match(wm_class="obs"),
        ],
    ),
    ScratchPad(
        "scratchpad",
        [
            DropDown("python", f"{TERMINAL} -e python", **spad_kw),
            DropDown("terminal", f"{TERMINAL}", **spad_kw),
        ],
    ),
]


# ------------------
#     LAYOUTS
# ------------------
layout_config = dict(
    margin=5,
    border_on_single=True,
    border_width=0,
    single_border_width=0,
    margin_on_single=5,
    border_focus=color.get("primary", "#ff000"),
    border_normal=color.get("bg", "#ff0000"),
    border_focus_stack=color.get("secondary", "#ff0000"),
    border_normal_stack=color.get("bg", "#ff0000"),
)

layouts = [
    layout.Columns(**layout_config, insert_position=1),
    layout.Max(**layout_config),
]

# ---------------------
#    Floating Layout
# ---------------------
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="Tk"),  # tkinter
        Match(wm_class="vlc"),  # VLC media player
        Match(wm_class="simplescreenrecorder"),  # VLC media player
        Match(wm_class="pavucontrol"),  # VLC media player
        Match(wm_class="main.py"),  # Pygame zero
        Match(wm_class="xarchiver"),  # tkinter
        Match(wm_class="Toplevel"),  # tkinter toplevel window
        Match(wm_class="Places"),  # Firefox download window
        Match(wm_class="notification"),
        Match(wm_class="Dunst"),
        Match(wm_class="ffplay"),
        Match(wm_class="hiddify"),
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
    **layout_config,
)


# ---------------------
#    SCREEN WIDGETS
# ---------------------
def sep(bg, pad=5):
    return widget.Sep(background=bg, padding=pad, linewidth=0)


widget_defaults = dict(
    font="Not Sans Mono",
    fontsize=13,
)
extension_defaults = widget_defaults.copy()

bar_widgets = [
    widget.GroupBox(
        highlight_method="block",
        background=color.get("inactive", "#ff0000"),
        active=color.get("active", "#ff0000"),
        inactive="#696969",
        this_current_screen_border=color.get("primary", "#ff0000"),
        block_highlight_text_color=color.get("active", "#ff0000"),
        padding_x=5,
        padding_y=2,
    ),
    sep(bg=color.get("bg", "#ff0000"), pad=1),
    widget.CurrentLayout(
        background=color.get("inactive", "#ff0000"),
        foreground=color.get("fg", "#ff0000"),
        padding=10,
    ),
    sep(bg=color.get("bg", "#ff0000"), pad=1),
    widget.WindowCount(
        background=color.get("inactive", "#ff0000"),
        foreground=color.get("fg", "#ff0000"),
    ),
    widget.Spacer(),
    widget.Net(
        prefix="M",
        background=color.get("inactive", "#ff0000"),
        foreground=color.get("fg", "#ff0000"),
        padding=10,
        format="{down:1.2f}{down_suffix} ↓↑ {up:1.2f}{up_suffix}",
    ),
    sep(bg=color.get("bg", "#ff0000"), pad=1),
    widget.KeyboardLayout(
        background=color.get("inactive", "#ff0000"),
        foreground=color.get("fg", "#ff0000"),
        configured_keyboards=["us", "ir"],
        padding=10,
    ),
    sep(bg=color.get("bg", "#ff0000"), pad=1),
    widget.Volume(
        background=color.get("inactive", "#ff0000"),
        foreground=color.get("fg", "#ff0000"),
        padding=10,
    ),
    sep(bg=color.get("bg", "#ff0000"), pad=1),
    widget.Clock(
        background=color.get("inactive", "#ff0000"),
        foreground=color.get("fg", "#ff0000"),
        format="%H:%M",
        padding=10,
    ),
    sep(bg=color.get("bg", "#ff0000"), pad=1),
    widget.Systray(),
]

# Bars
bar_widgets = bar_widgets.copy()
bar = bar.Bar(
    bar_widgets,
    border_width=3,
    border_color=color["bg"],
    background=color.get("bg"),
    size=20,
    opacity=0.95,
    margin=[5, 5, 0, 5],
)

# Screens
screen = Screen(top=bar)
screens = [screen]

# ---------------
# Defult settings
# ---------------
dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = True
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wmname = "Qtile"


# ---------------
# Hooks
# ---------------
@hook.subscribe.float_change
def float_change():
    window = qtile.current_window
    is_maximized = window.info().get("maximized")
    if not is_maximized:
        window.center()


@hook.subscribe.client_new
def float_centerize(window):
    window.center()


@hook.subscribe.startup_once
def autostart():
    Popen([f"{HOME}/.local/bin/autostart.sh"])
    # qtile.spawn(f"{TERMINAL} -e tmux")
    # qtile.spawn(f"{BROWSER}")
