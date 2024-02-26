#!/usr/bin/env bash
sleep 1
pkill -9 -e xdg-desktop-portal-hyprland
pkill -9 -e xdg-desktop-portal-wlr
pkill -9 xdg-desktop-portal
/run/current-system/sw/libexec/xdg-desktop-portal-hyprland
sleep 2
/run/current-system/sw/libexec/xdg-desktop-portal & pkill -9 pipewire && pkill -9 pipewire-pulse