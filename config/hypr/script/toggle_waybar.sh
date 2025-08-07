#!/usr/bin/env bash

PID=$(pgrep waybar)

if [[ -n "$PID" ]]; then
  pkill waybar
else
  waybar
fi
