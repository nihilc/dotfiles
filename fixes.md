### Enable ssh-agent start on session

Create `~/.config/systemd/user/ssh-agent.service`

Add the following content

```systemd
[Unit]
Description=SSH key agent

[Service]
Type=simple
Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
ExecStart=/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK

[Install]
WantedBy=default.target
```

Enable and Start the service

```sh
systemctl --user daemon-reload
systemctl --user enable --now ssh-agent.service
```

You need to tell your shell where to find the ssh-agent socket by setting the
`SSH_AUTH_SOCK` environment variable. Add the following line to your shell'
s configuration file (e.g., ~/.bashrc, ~/.zshrc, or ~/.profile)

```sh
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
```

### Disable integrad display

List the displays

```sh
ls /sys/class/drm
```

There are something like `card1-eDP-1` and `card1-HDMI-A-1` the `eDP-X` is the integrated

To disable the display in systemd-boot, edit `/boot/loader/entries/<entry-date>_linux.conf` and append in options `video=eDP-1:d`

### Fix gtk3 theme for legacy apps

Install adwaita theme

```sh
sudo pacman -S adw-gtk-theme
```

Set `adw-gtk3-dark` on tweaks for legacy applications

To fix flatpaks

```sh
flatpak install flathub org.gtk.Gtk3theme.adw-gtk3-dark
flatpak override --user --env=GTK_THEME=adw-gtk3-dark
```

### Uniform look between gtk and qt (adwaita)

Install qt6ct and kvantum
```sh
yay -S qt6ct kvantum
```

Download [KvLibadwaita](https://github.com/GabePoel/KvLibadwaita)

Open qt6ct and select `kvantum-dark`

Open kvantum and select KvLibadwaitaDark

Set environment variables

```sh
QT_QPA_PLATFORMTHEME=qt6ct
QT_STYLE_OVERRIDE=kvantum
```
